import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/features/ip_detector/data/datasources/ip_remote_datasource.dart';
import 'package:untitled/features/ip_detector/data/repositories/ip_repostory_impl.dart';
import 'package:untitled/features/ip_detector/domain/repositories/ip_repository.dart';
import 'package:untitled/features/ip_detector/domain/usecases/get_ip_info.dart';
import 'package:untitled/features/ip_detector/presentation/providers/ip_provider.dart';
import 'package:untitled/features/settings/presentation/provider/settings_provider.dart';

var sl = GetIt.instance;

void init() {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  // Feature: Settings
  sl.registerSingleton<SettingsProvider>(SettingsProvider());

  // Feature: IP Detector
  //Data Sources
  sl.registerFactory<IpRemoteDataSource>(() => IIpRemoteDatasource(dio: sl()));
  //Repositories
  sl.registerFactory<IpRepository>(() => IIpRepository(dataSource: sl()));
  //Use Cases
  sl.registerFactory(() => GetIpInfo(repository: sl()));
  //Providers
  sl.registerFactory(() => IpProvider(getIpInfo: sl()));
}
