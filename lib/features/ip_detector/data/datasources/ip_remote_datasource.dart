import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:untitled/features/ip_detector/data/models/ip.dart';

abstract class IpRemoteDataSource{
  Future<IpModel> findMyIp();
}

class IIpRemoteDatasource extends IpRemoteDataSource {
  final Dio dio;

  IIpRemoteDatasource({required this.dio});

  @override
  Future<IpModel> findMyIp() async {
    var response = await dio.get("https://api.myip.com");
    return IpModel.fromJson(jsonDecode(response.data));
  }
}