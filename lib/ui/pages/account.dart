import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluze/core/cubits/account/account_cubit.dart';

import '../../helpers/assets/colors.dart';
import '../../helpers/assets/strings.dart';
import '../../helpers/di/dependency.dart';
import '../../helpers/utils/funcs.dart';
import '../navigation/naviagation_manager_interface.dart';
import '../navigation/navigation_manager.dart';
import '../widgets/app_button.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: _AccountPage(),
    );
  }
}


class _AccountPage extends StatefulWidget {
  @override
  __AccountPageState createState() => __AccountPageState();
}

class __AccountPageState extends State<_AccountPage> {

  final NavigationManager _navigationManager = locator.get<NavigationManager>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode nameNode = FocusNode();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    nameTextEditingController.dispose();
    nameNode.dispose();
    emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: BlocListener<AccountCubit, AccountState>(
            listener: (context, state) {
              if (state is AccountSuccess) {
                _navigationManager.push(AppRoute.passcodePage);
              }
            },
            child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppFunctions().verticalSpacing(16.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.createAccount,
                                    style: AppFunctions().adaptableTextStyle(size: 32, fontWeight: FontWeight.w600, color: AppColors.black),
                                  )
                                ],
                              ),

                              AppFunctions().verticalSpacing(32.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.name,
                                    style: AppFunctions().adaptableTextStyle(size: 20.0, fontWeight: FontWeight.w600, color: AppColors.black),
                                  )
                                ],
                              ),

                              AppFunctions().verticalSpacing(8.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextFormField(
                                            controller: nameTextEditingController,
                                            focusNode: nameNode,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                                            ],
                                            validator: (String? value) {
                                              if (value == null || value.isEmpty || value.length < 2) {
                                                return 'Enter a valid name with characters greater than two';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              fillColor: AppColors.white,
                                              disabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),
                                              enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),
                                              errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),
                                              filled: true,
                                              hintText: '',
                                              hintStyle: AppFunctions().adaptableTextStyle(size: 14.0, fontWeight: FontWeight.w400, color: AppColors.black),
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),

                                            )
                                        ),
                                      )
                                  )
                                ],
                              ),

                              AppFunctions().verticalSpacing(16.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.email,
                                    style: AppFunctions().adaptableTextStyle(size: 20.0, fontWeight: FontWeight.w600, color: AppColors.black),
                                  )
                                ],
                              ),

                              AppFunctions().verticalSpacing(8.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextFormField(
                                            controller: emailTextEditingController,
                                            focusNode: emailNode,
                                            validator: (String? value) {
                                              if (value == null || value.isEmpty || AppFunctions().validateEmail(value) == false) {
                                                return 'Enter a valid email';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              fillColor: AppColors.white,
                                              filled: true,
                                              hintText: '',
                                              hintStyle: AppFunctions().adaptableTextStyle(size: 14.0, fontWeight: FontWeight.w400, color: AppColors.black),
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),
                                              disabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),
                                              enabledBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),
                                              errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.white),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                                              ),

                                            )
                                        ),
                                      )
                                  )
                                ],
                              ),

                              AppFunctions().verticalSpacing(24.0),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: AppButton(
                                        buttonText: AppStrings.next,
                                        voidCallback: () {
                                          if (_formKey.currentState!.validate()) {
                                            _formKey.currentState!.save();
                                            context.read<AccountCubit>().submit(email: emailTextEditingController.text, name: nameTextEditingController.text);
                                          }
                                        },
                                        enabled: true,
                                        enabledColor: AppColors.primary,
                                        textColor: Colors.white,
                                      )
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
