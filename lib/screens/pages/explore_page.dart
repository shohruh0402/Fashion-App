import 'package:fashionapp/screens/sizeconfig.dart';
import 'package:fashionapp/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          MyAppBarWidgets(
            color: Colors.white,
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: he(300),
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                child: SizedBox(
                    width: wi(165),
                    child: Container(
                      width: wi(165),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: he(220),
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Image.asset(
                                  data_for[index].image,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    bottom: he(6),
                                    right: wi(9),
                                    child: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Color(0xFFDD8560),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: he(5)),
                          Text(
                            data_for[index].name,
                            style: TextStyle(fontSize: wi(12)),
                          ),
                          SizedBox(height: he(5)),
                          Text(
                            data_for[index].price,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: wi(15), color: Color(0xFFDD8560)),
                          )
                        ],
                      ),
                    )),
              ),
              itemCount: data_for.length,
            ),
          )
        ],
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
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(1).png',
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora cardigan',
    price: '\$120',
  ),
];
