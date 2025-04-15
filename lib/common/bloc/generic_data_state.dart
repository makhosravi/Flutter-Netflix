abstract class GenericDataState {}

class DataLoadind extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {
  final T data;
  DataLoaded({required this.data});
}

class FailureData extends GenericDataState {
  final String errorMessage;
  FailureData({required this.errorMessage});
}
