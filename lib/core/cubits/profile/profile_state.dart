part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileWithUser extends ProfileState {
  final String email;
  final String name;

  const ProfileWithUser(this.email, this.name);
  @override
  List<Object> get props => [email, name];
}
