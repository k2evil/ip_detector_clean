import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/features/ip_detector/data/datasources/ip_remote_datasource.dart';
import 'package:untitled/features/ip_detector/domain/entities/ip_info.dart';
import 'package:untitled/features/ip_detector/domain/repositories/ip_repository.dart';

class IIpRepository extends IpRepository {
  final IpRemoteDataSource dataSource;

  IIpRepository({required this.dataSource});

  @override
  Future<Either<Failure?, IpInfo>> getIpInfo() async {
    try {
      var response = await dataSource.findMyIp();
      var result = IpInfo.fromModel(response);
      return Right(result);
    } catch (e) {
      print(e);
      return const Left(null);
    }
  }
}
