import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluze/data/storage/shared_prefs.dart';

import '../../../data/models/user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getUser() async {
    User user = await AppStorage().getUserData();
    emit(ProfileWithUser(user.email!, user.name!));
  }

}
