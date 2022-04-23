import 'package:fashionapp/screens/sizeconfig.dart';
import 'package:fashionapp/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List collectionName = ['All', 'Apparel', 'Dress', 'Tshirt', 'Bag'];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
             MyAppBarWidgets(),
            SizedBox(
                height: he(650),
                width: double.infinity,
                child: Image.asset(
                  'assets/images/Banner.png',
                  fit: BoxFit.cover,
                )),
            SizedBox(height: he(35)),
            Text(
              'N e w  A r r i v a l',
              style: TextStyle(fontSize: wi(18), fontWeight: FontWeight.w400),
            ),
            Image.asset(
              'assets/icons/3.png',
              height: he(30),
              width: wi(124),
            ),
            SizedBox(
              height: he(36),
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.only(left: wi(20)),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: wi(26)),
                    child: Text('${collectionName[index]}'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: he(530),
              width: wi(343),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 0),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 280,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: wi(165),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: he(200),
                            width: double.infinity,
                            child: Image.asset(
                              data_for[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: index == 3 ? he(5) : 0),
                          Text(
                            data_for[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: wi(12)),
                          ),
                          Text(
                            data_for[index].price,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: wi(15), color: Color(0xFFDD8560)),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: he(40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Explore More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: wi(16),
                  ),
                ),
                SizedBox(width: wi(8)),
                const Icon(Icons.arrow_forward)
              ],
            ),
            const SizedBox(height: 322),
          ],
        ),
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
    name: '21WN reversible angora\ncardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(1).png',
    name: '21WN reversible angora\ncardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(2).png',
    name: '21WN reversible angora\ncardigan',
    price: '\$120',
  ),
  OnBoards(
    image: 'assets/images/Rectangle 325(3).png',
    name: 'Oblong bag',
    price: '\$120',
  ),
];
