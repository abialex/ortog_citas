abstract class UseCaseParams<Type, Params> {
  Future<Type> call(Params params);
}
