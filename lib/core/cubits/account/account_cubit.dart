import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluze/data/storage/shared_prefs.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  void submit({ String? email, String? name }) async {
    await AppStorage().saveUserData(email: email, name: name);
    emit(AccountSuccess());

  }

}


