import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluze/core/cubits/profile/profile_cubit.dart';
import 'package:fluze/helpers/assets/images.dart';
import 'package:fluze/helpers/utils/funcs.dart';

import '../../helpers/assets/colors.dart';
import '../../helpers/assets/strings.dart';
import '../../helpers/di/dependency.dart';
import '../navigation/naviagation_manager_interface.dart';
import '../navigation/navigation_manager.dart';
import '../widgets/app_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUser(),
      child: _ProfilePage(),
    );
  }
}


class _ProfilePage extends StatefulWidget {
  @override
  __ProfilePageState createState() => __ProfilePageState();
}

class __ProfilePageState extends State<_ProfilePage> {
  final NavigationManager _navigationManager = locator.get<NavigationManager>();
  String email = "";
  String name = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {

          if (state is ProfileWithUser) {
            email = state.email;
            name = state.name;
          }

          return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    AppFunctions().verticalSpacing(16.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.avatar)
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.name,
                          style: AppFunctions().adaptableTextStyle(size: 32, fontWeight: FontWeight.w600, color: AppColors.black),
                        )
                      ],
                    ),

                    AppFunctions().verticalSpacing(8.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${AppStrings.name}:',
                          style: AppFunctions().adaptableTextStyle(size: 16, fontWeight: FontWeight.w400, color: AppColors.black),
                        ),
                        Text(
                          name,
                          style: AppFunctions().adaptableTextStyle(size: 16, fontWeight: FontWeight.w400, color: AppColors.black),
                        ),
                      ],
                    ),

                    AppFunctions().verticalSpacing(8.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${AppStrings.email}:',
                          style: AppFunctions().adaptableTextStyle(size: 16, fontWeight: FontWeight.w400, color: AppColors.black),
                        ),
                        Text(
                          email,
                          style: AppFunctions().adaptableTextStyle(size: 16, fontWeight: FontWeight.w400, color: AppColors.black),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                            child: AppButton(
                              buttonText: AppStrings.clearAccount,
                              voidCallback: () {
                                _navigationManager.pushClean(AppRoute.accountPage);
                              },
                              enabled: true,
                              enabledColor: AppColors.neutral,
                              textColor: Colors.white,
                            )
                        ),

                        AppFunctions().horizontalSpacing(8.0),

                        Expanded(
                            child: AppButton(
                              buttonText: AppStrings.logOut,
                              voidCallback: () {
                                _navigationManager.pushClean(AppRoute.accountPage);
                              },
                              enabled: true,
                              enabledColor: AppColors.primary,
                              textColor: Colors.white,
                            )
                        )

                      ],
                    )

                  ],
                ),
              );
        },
),
      ),
    );
  }
}
