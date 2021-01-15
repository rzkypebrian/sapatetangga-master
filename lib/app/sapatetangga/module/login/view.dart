import 'package:enerren/app/sapatetangga/module/login/presenter.dart';
import 'package:enerren/app/sapatetangga/module/login/viewModel.dart';
import 'package:enerren/component/BottonComponent.dart';
import 'package:enerren/component/InputComponent.dart';
import 'package:enerren/util/SystemUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class View extends PresenterState {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (context) => super.model,
      child: Consumer<ViewModel>(builder: (ctx, dt, child) {
        return Scaffold(
          body: Container(
            color: Colors.blue,
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      bottom: 15,
                    ),
                    child: SvgPicture.asset("assets/sapatetangga/icon_itb.svg",
                        height: 100, width: 100),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "LPPM-ITB",
                      style: System.data.textStyleUtil.mainLabel(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Aplikasi Sapa Diri & Tetangga",
                      style: System.data.textStyleUtil.mainLabel(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 40, left: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: InputComponent.inputTextWithCorner(
                            controller: noKkController,
                            focusnode: noKkFocusNode,
                            fontColor: Colors.white,
                            borderInputGray:
                                noKkController.stateInput == StateInput.Error
                                    ? Colors.red
                                    : Colors.white,
                            corner: 7,
                            hintText: "No. KK",
                            hintColor: Colors.grey[350],
                            suffixIcon: SvgPicture.asset(
                              "assets/sapatetangga/icon_user.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: InputComponent.inputTextWithCorner(
                            controller: passwordController,
                            focusnode: passwordFocusNode,
                            fontColor: Colors.white,
                            borderInputGray: passwordController.stateInput ==
                                    StateInput.Error
                                ? Colors.red
                                : Colors.white,
                            corner: 7,
                            hintText: "Password",
                            hintColor: Colors.grey[350],
                            obscureText: true,
                            suffixIcon: Container(
                              child: SvgPicture.asset(
                                "assets/sapatetangga/icon_key.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 200, top: 20, bottom: 20),
                          child: Text(
                            "Lupa Kata Sandi ?",
                            style: System.data.textStyleUtil.linkLabel(
                                color: Colors.white,
                                fontSize: System.data.fontUtil.l),
                          ),
                        ),
                        Container(
                          child: BottonComponent.roundedButton(
                            onPressed: submit,
                            text: "Login",
                            textstyle: System.data.textStyleUtil.mainLabel(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: System.data.fontUtil.xl),
                            colorBackground: Color(0xff0C74F2),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                                spreadRadius: -3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: RichText(
                        text: TextSpan(
                          text: "Belum punya akun ? ",
                          style: System.data.textStyleUtil.mainLabel(
                            color: Colors.white,
                            fontSize: System.data.fontUtil.xl,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " Daftar",
                              style: System.data.textStyleUtil.linkLabel(
                                color: Colors.blue[900],
                                fontSize: System.data.fontUtil.xl,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
