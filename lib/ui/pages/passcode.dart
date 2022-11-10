import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helpers/assets/colors.dart';
import '../../helpers/assets/strings.dart';
import '../../helpers/di/dependency.dart';
import '../../helpers/utils/funcs.dart';
import '../navigation/naviagation_manager_interface.dart';
import '../navigation/navigation_manager.dart';
import '../widgets/app_button.dart';
import '../widgets/back_button.dart';

class PasscodePage extends StatefulWidget {
  const PasscodePage({super.key});

  @override
  _PasscodePageState createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {

  final NavigationManager _navigationManager = locator.get<NavigationManager>();
  final _formKey = GlobalKey<FormState>();
  String code = "";

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppFunctions().horizontalSpacing(1.0),
                        AppBackButton( voidCallback: () {
                          _navigationManager.pushClean(AppRoute.accountPage);
                        } ),
                      ],
                    ),

                    AppFunctions().verticalSpacing(32.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.createPasscode,
                          style: AppFunctions().adaptableTextStyle(size: 32, fontWeight: FontWeight.w600, color: AppColors.black),
                        )
                      ],
                    ),

                    AppFunctions().verticalSpacing(8.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            AppStrings.makeIt,
                            style: AppFunctions().adaptableTextStyle(size: 16, fontWeight: FontWeight.w500, color: AppColors.fair),
                          ),
                        )
                      ],
                    ),

                    AppFunctions().verticalSpacing(32.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: PinCodeTextField(
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                              ],
                              textStyle: AppFunctions().adaptableTextStyle(size: 14.0, fontWeight: FontWeight.w500, color: AppColors.black),
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.circle,
                                  borderRadius: BorderRadius.circular(10),
                                  fieldHeight: 60,
                                  fieldWidth: 50,
                                  activeFillColor: AppColors.white,
                                  inactiveFillColor: AppColors.white,
                                  selectedFillColor: AppColors.white,
                                  activeColor: AppColors.primary,
                                  disabledColor: AppColors.white,
                                  inactiveColor: Colors.grey,
                                  selectedColor: AppColors.primary,
                                  borderWidth: 0.5
                              ),
                              appContext: context,
                              onChanged: (String value) {  },
                              validator: (String? value) {
                                if (value == null || value.length < 6) {
                                  return 'Enter a valid pin';
                                } else if (AppFunctions().validateRepetition(value) == false) {
                                  return 'Numbers in pin must appear at most twice';
                                } else if (AppFunctions().validateSequence(value) == false) {
                                  return 'Numbers must not be in sequence';
                                }
                                return null;
                              },
                              onCompleted: (String value) {
                                code = value;
                              },
                            )
                        )
                      ],
                    ),

                    AppFunctions().verticalSpacing(16.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: AppButton(
                              buttonText: AppStrings.confirm,
                              voidCallback: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  _navigationManager.push(AppRoute.profilePage);
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
    );
  }
}
