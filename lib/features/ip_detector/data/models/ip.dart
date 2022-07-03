class IpModel {
  final String ip;
  final String country;
  final String cc;

  IpModel({required this.ip, required this.country, required this.cc});

  factory IpModel.fromJson(Map<String, dynamic> json) =>
      IpModel(ip: json["ip"], country: json["country"], cc: json["cc"]);
}
