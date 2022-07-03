import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/features/ip_detector/domain/entities/ip_info.dart';

abstract class IpRepository{
  Future<Either<Failure?, IpInfo>> getIpInfo();
}