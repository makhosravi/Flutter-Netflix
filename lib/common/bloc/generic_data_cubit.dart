import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/bloc/generic_data_state.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoadind());
  void getData<T>(Usecase usecase, {dynamic params}) async {
    var returnedData = await usecase.call(params: params);
    returnedData.fold(
      (error) {
        emit(FailureData(errorMessage: error));
      },
      (data) {
        emit(DataLoaded<T>(data: data));
      },
    );
  }
}
