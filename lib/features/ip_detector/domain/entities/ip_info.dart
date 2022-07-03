import 'package:untitled/features/ip_detector/data/models/ip.dart';

class IpInfo {
  final String ip;
  final String country;
  final String shortCountry;

  IpInfo({required this.ip, required this.country, required this.shortCountry});

  factory IpInfo.fromModel(IpModel model) => IpInfo(
        ip: model.ip,
        country: model.country,
        shortCountry: model.cc,
      );
}
