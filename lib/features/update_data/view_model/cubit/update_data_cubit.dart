import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/features/update_data/model/repos/update_data_repo_interface.dart';

import '../../model/models/update_profile_data_response/update_profile_data_response.dart';

part 'update_data_state.dart';

class UpdateDataCubit extends Cubit<UpdateDataState> {
  final UpdateDataRepoInterface _updateDataRepoInterface;
  UpdateDataCubit(this._updateDataRepoInterface) : super(UpdateDataInitial());
  static UpdateDataCubit get(context) => BlocProvider.of(context);

  late UpdateProfileDataResponse updateProfileDataResponse;
  Future updateDataFunction({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(LoadingUpdateProfileDataState());
    _updateDataRepoInterface
        .updateDataFunction(name: name, email: email, phone: phone)
        .then((value) {
          log("-----------------------------");
          updateProfileDataResponse = UpdateProfileDataResponse.fromJson(
            value.data,
          );

          emit(
            SuccessfullyUpdateProfileDataState(
              message: updateProfileDataResponse.message!,
              status: updateProfileDataResponse.status!,
            ),
          );
        })
        .catchError((error) {
          log(error.toString());
          emit(ErrorUpdateProfileDataState(error: error.toString()));
        });
  }
}
