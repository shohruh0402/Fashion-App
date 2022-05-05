import 'package:fashionapp/screens/bloc/bloc_state.dart';
import 'package:fashionapp/screens/sizeconfig.dart';
import 'package:fashionapp/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  DetailPage({Key? key, this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => SavatCubit(),
      child: likeScaffold(context),
    );
  }

  Scaffold likeScaffold(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SavatCubit,SavatState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBarWidgets(),
                Container(
                  margin: const EdgeInsets.all(16),
                  height: he(460),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Hero(
                        tag: '${widget.data[1]}',
                        child: Image.network(
                            "http://10.0.2.2:1337" + widget.data[0]['img']['data'][0]['attributes']['url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: he(10),
                        top: he(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.white38,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(radius: 5, backgroundColor: Colors.grey),
                    SizedBox(width: wi(10)),
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.data[0]['shopname'],
                            style: TextStyle(
                              fontSize: wi(16),
                            ),
                          ),
                          const Icon(Icons.ios_share_sharp)
                        ],
                      ),
                      SizedBox(height: he(8)),
                      Text(
                        widget.data[0]['subtitle'],
                        style: TextStyle(
                            fontSize: wi(16), color: const Color(0xFF555555)),
                      ),
                      SizedBox(height: he(8)),
                      Text(
                        '\$ ${widget.data[0]['price']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: wi(18), color: Color(0xFFDD8560)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: he(56),
        child: Row(
          children: [
            SizedBox(width: wi(16)),
            const Icon(Icons.add, color: Colors.white),
            SizedBox(width: wi(8)),
            Text(
              'Add to basket',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: wi(18), color: Colors.white),
            ),
            SizedBox(width: wi(163)),
            const Icon(Icons.favorite_border_outlined, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
