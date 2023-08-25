abstract class Interactor<T, P> {
  Future<T> call(P param);
}
