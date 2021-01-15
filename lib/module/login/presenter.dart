import 'dart:convert';

import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:enerren/component/sieradDecorationComponent.dart';
import 'package:enerren/model/AccountModel.dart';
import 'package:enerren/util/ErrorHandlingUtil.dart';
import 'package:enerren/util/ModeUtil.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:enerren/util/TypeUtil.dart';
import 'package:enerren/util/constantUtil.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'view.dart';
import 'package:http/http.dart' as http;

class Presenter extends StatefulWidget {
  final State<Presenter> view;
  final VoidCallback onSubmitSuccess;
  final String username;
  final String password;
  final ValueChanged<Map<String, dynamic>> onLoginSuccess;
  final ValueChanged2Param<String, String> onSubmit;
  final ValueChanged3Param<String, String, Map<String, dynamic>> onAccessDenied;
  final ValueChanged2Param<String, String> onForgotPassword;
  final ValueChanged<AccountModel> onForgotPasswordSuccess;
  final double containerHeight;
  final ValueChanged<GoogleSignInAccount> onSuccessLoginWithGoogle;
  final ValueChanged<Map<String, dynamic>> onThirdPartyLoginDenied;

  const Presenter({
    Key key,
    this.view,
    this.onSubmitSuccess,
    this.onLoginSuccess,
    this.username,
    this.password,
    this.onSubmit,
    this.onAccessDenied,
    this.onForgotPassword,
    this.onForgotPasswordSuccess,
    this.containerHeight,
    this.onSuccessLoginWithGoogle,
    this.onThirdPartyLoginDenied,
  }) : super(key: key);

  createState() {
    if (view != null) {
      return view;
    } else {
      return View();
    }
  }
}

abstract class PresenterState extends State<Presenter> {
  CircularProgressIndicatorController loadingController =
      new CircularProgressIndicatorController();
  InputComponentTextEditingController usernameController =
      new InputComponentTextEditingController();
  FocusNode membercodeFocusNode = new FocusNode();
  FocusNode usernameFocuseNode = new FocusNode();
  InputComponentTextEditingController passwordController =
      new InputComponentTextEditingController();
  FocusNode passwordFocuseNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    loadingController.stopLoading();
    usernameController.text = widget.username ?? "";
    passwordController.text = widget.password ?? "";
    // googleSignIn.signInSilently();
  }

  void submitSuccess() {
    if (widget.onSubmitSuccess != null) {
      widget.onSubmitSuccess();
    } else {
      loadingController.stopLoading(
          message: "submit success callback not found");
    }
  }

  bool validateUsername() {
    print("masuk sini");
    if (usernameController.text.isEmpty) {
      usernameController.setStateInput = StateInput.Error;
      setState(() {});
      return false;
    } else {
      usernameController.setStateInput = StateInput.Enable;
      setState(() {});
      return null;
    }
  }

  bool validatePassword() {
    if (passwordController.text.isEmpty) {
      passwordController.setStateInput = StateInput.Error;
      return false;
    } else {
      passwordController.setStateInput = StateInput.Enable;
      return null;
    }
  }

  void submit() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (!validate()) return;
    if (widget.onSubmit != null) {
      widget.onSubmit(
        usernameController.text,
        passwordController.text,
      );
    } else {
      loadingController.startLoading();
      ModeUtil.debugPrint(
          "Login With Device Id ${System.data.global.mmassagingToken}");
      AccountModel.login(
        token: "",
        username: usernameController.text,
        password: passwordController.text,
        deviceId: System.data.global.mmassagingToken,
      ).then((response) {
        onLoginSuccess(response);
      }).catchError(
        (onError) {
          try {
            http.Response error = onError;
            if (error.statusCode == 403) {
              if (widget.onAccessDenied != null) {
                widget.onAccessDenied(
                  usernameController.text,
                  passwordController.text,
                  json.decode(error.body),
                );
              } else {
                loadingController.stopLoading(
                    message:
                        "${error.body.isNotEmpty ? error.body : error.statusCode}");
              }
            } else {
              loadingController.stopLoading(
                  message:
                      "${error.body.isNotEmpty ? error.body : error.statusCode}");
            }
          } catch (e) {
            loadingController.stopLoading(
              message: "$onError",
            );
          }
        },
      );
    }
  }

  void onForgotPassword() {
    if (validateUsername() == false) return;
    if (widget.onForgotPassword != null) {
      widget.onForgotPassword(usernameController.text, passwordController.text);
    } else {
      loadingController.startLoading();
      AccountModel.checkAccount(
        username: usernameController.text,
        isResetPassword: true,
        token: " ",
      ).then((onValue) {
        loadingController.stopLoading();
        if (widget.onForgotPasswordSuccess != null) {
          widget.onForgotPasswordSuccess(onValue);
        } else {
          ModeUtil.debugPrint(onValue.toString());
        }
      }).catchError((onError) {
        String _message;
        try {
          http.Response response = onError;
          _message =
              "${response.body.isNotEmpty ? response.body : response.statusCode}";
        } catch (e) {
          _message = "$onError";
        }
        loadingController.stopLoading(
          messageAlign: Alignment.topCenter,
          messageWidget: DecorationComponent.topMessageDecoration(
            backgroundColor: System.data.colorUtil.redColor,
            message: "$_message",
          ),
        );
      });
    }
  }

  void onLoginSuccess(Map<String, dynamic> response) {
    if (widget.onLoginSuccess != null) {
      loadingController.stopLoading();
      widget.onLoginSuccess(response);
    } else {
      loadingController.stopLoading(message: "call onLoginSuccess: $response");
    }
  }

  bool validate() {
    bool isValid = true;
    isValid = validateUsername() ?? isValid;
    isValid = validatePassword() ?? isValid;
    return isValid;
  }

  void signInWithGoogle() {
    loadingController.startLoading();
    System.data.googleSign.signOut().then((value) {
      System.data.googleSign.signIn().whenComplete(() {
        ModeUtil.debugPrint("Nandang ${System.data.googleSign.name}");
        AccountModel.thirdPartyLogin(
          deviceId: System.data.global.mmassagingToken,
          fullName: System.data.googleSign.name,
          username: System.data.googleSign.email,
          token: "",
          imageUrl: System.data.googleSign.imageUrl,
          phoneNumber: System.data.googleSign.phoneNumber,
          thirdPartyName: ConstantUtil.loginByGoogle,
          thirdPartyUserId: System.data.googleSign.id,
        ).then((value) {
          if (widget.onLoginSuccess != null) {
            widget.onLoginSuccess(value);
          }
        }).catchError((onError) {
          loadingController.stopLoading(
              isError: true,
              messageAlign: Alignment.topCenter,
              messageWidget: DecorationComponent.topMessageDecoration(
                message: ErrorHandlingUtil.handleApiError(onError),
              ));
        });
      });
    });
  }

  void loginWithFacebook() {
    loadingController.startLoading();
    System.data.facebookLogin.logout().then((value) {
      System.data.facebookLogin.login(onCancel: (status) {
        loadingController.stopLoading();
      }, onError: (status) {
        loadingController.stopLoading();
      }, onLoggedIn: (status, data) {
        AccountModel.thirdPartyLogin(
          deviceId: System.data.global.mmassagingToken,
          fullName: System.data.facebookLogin.name,
          username: System.data.facebookLogin.email,
          token: "",
          imageUrl: System.data.facebookLogin.imageUrl,
          thirdPartyName: ConstantUtil.loginByFacebook,
          thirdPartyUserId: System.data.facebookLogin.id,
        ).then((value) {
          if (widget.onLoginSuccess != null) {
            widget.onLoginSuccess(value);
          }
        }).catchError((onError) {
          loadingController.stopLoading(
              isError: true,
              messageAlign: Alignment.topCenter,
              messageWidget: DecorationComponent.topMessageDecoration(
                message: ErrorHandlingUtil.handleApiError(onError),
              ));
        });
      });
    });
  }
}
