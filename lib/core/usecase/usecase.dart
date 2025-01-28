// usecase is used to connect presentation layer to logic layer
// usecase is defined in domain layer
abstract class Usecase<Type, Params> {
  Future<Type> call({Params params});
}
