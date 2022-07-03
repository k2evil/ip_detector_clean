import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/core/usecases/usecase.dart';
import 'package:untitled/features/ip_detector/domain/entities/ip_info.dart';
import 'package:untitled/features/ip_detector/domain/repositories/ip_repository.dart';

class GetIpInfo extends UseCase<IpInfo, NoParams> {
  final IpRepository repository;

  GetIpInfo({required this.repository});

  @override
  Future<Either<Failure?, IpInfo>> call(NoParams params) {
    return repository.getIpInfo();
  }
}
