import 'package:fashionapp/screens/bloc/bloc_state.dart';
import 'package:fashionapp/screens/sizeconfig.dart';
import 'package:fashionapp/service/service_data.dart';
import 'package:fashionapp/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => SavatCubit(),
      child: exploreScaffold(),
    );
  }

  Scaffold exploreScaffold() {
    return Scaffold(
      body: BlocBuilder<SavatCubit, SavatState>(
        builder: (context, state) {
          return FutureBuilder(
            future: FashionService.getDataFashion(),
            builder: (context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snap.hasError) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return Column(
                  children: [
                    MyAppBarWidgets(
                      color: Colors.white,
                    ),
                    Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: he(302),
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final item = index;
                          return GestureDetector(
                            child: SizedBox(
                                width: wi(165),
                                child: Container(
                                  width: wi(165),
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: '$item',
                                        child: SizedBox(
                                          height: he(220),
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              Image.network(
                                                "http://10.0.2.2:1337" + snap.data['data'][index]['attributes']['img']['data'][0]['attributes']['url'],
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                bottom: he(6),
                                                right: wi(9),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    BlocProvider.of<SavatCubit>(
                                                            context)
                                                        .likebos();
                                                  },
                                                  child: context
                                                          .watch<SavatCubit>()
                                                          .like
                                                      ? const Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          color:
                                                              Color(0xFFDD8560),
                                                        )
                                                      : const Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Color(0xFFDD8560),
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),SizedBox(height: 2),
                                      Text(
                                      snap.data['data'][index]['attributes']
                                            ['shopname'],
                                        style: TextStyle(fontSize: wi(15),fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: he(4)),
                                      Expanded(
                                        child: Text(
                                          snap.data['data'][index]['attributes']
                                              ['subtitle'],
                                          style: TextStyle(fontSize: wi(12)),
                                        ),
                                      ),
                                      SizedBox(height: he(5)),
                                      Text(
                                        '\$${snap.data['data'][index]['attributes']['price']}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: wi(15),
                                            color: Color(0xFFDD8560)),
                                      )
                                    ],
                                  ),
                                )),
                            onTap: () {
                              print(item);
                              Navigator.pushNamed(context, '/detail',
                                  arguments: [
                                    snap.data['data'][index]['attributes'],
                                    item
                                  ]);
                            },
                          );
                        },
                        itemCount: snap.data['data'].length,
                      ),
                    )
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}

class OnBoards {
  final String image, name, price;

  OnBoards({
    required this.image,
    required this.name,
    required this.price,
  });
}

// ignore: non_constant_identifier_names
final List<OnBoards> data_for = [
  OnBoards(
    image: 'assets/images/Rectangle 325.png',
    name: 'Samsung',
    price: '\$150',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(1).png',
    name: 'iphone',
    price: '\$6650',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$5420',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$234',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$5675',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$546',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$903',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$540',
  ),
];
