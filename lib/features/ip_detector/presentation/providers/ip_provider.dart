import 'package:flutter/material.dart';
import 'package:untitled/core/statuses/status.dart';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/ip_detector/domain/entities/ip_info.dart';
import 'package:untitled/features/ip_detector/domain/usecases/get_ip_info.dart';

class IpProvider extends ChangeNotifier {
  ScreenStatus status = ScreenStatus.uninitialized;
  IpInfo? ipInfo;

  final GetIpInfo getIpInfo;

  IpProvider({required this.getIpInfo});

  void checkIp() async {
    status = ScreenStatus.loading;
    notifyListeners();
    var response = await getIpInfo(NoParams());
    response.fold((failure) {
      status = ScreenStatus.error;
      notifyListeners();
    }, (result) {
      status = ScreenStatus.success;
      ipInfo = result;
      notifyListeners();
    });
  }
}
