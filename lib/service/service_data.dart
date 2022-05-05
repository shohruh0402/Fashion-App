import 'package:dio/dio.dart';

class FashionService {
  static Future getDataFashion() async {
    Response res = await Dio().get('http://10.0.2.2:1337/api/news?populate=*');
    return res.data;
  }
}
