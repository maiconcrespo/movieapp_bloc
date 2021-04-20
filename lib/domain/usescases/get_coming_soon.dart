import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/no_params.dart';
import 'package:movieapp/domain/repositories/movie_repositories.dart';
import 'package:movieapp/domain/usescases/usecases.dart';

class GetCommingSoon extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetCommingSoon(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getComingSoon();
  }
}
