import 'package:enerren/module/detailDriver/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'angkutPresenter.dart';

class AngkutView extends View with AngkutPresenter {
  @override
  Widget detailImage() {
    return Center(
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 200,
              height: 100,
              child: SvgPicture.asset("assets/angkut/backgroud_angkut_vehicle.svg"),
              margin: EdgeInsets.only(top: 15),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    offset: Offset(1, 3),
                    color: Colors.grey,
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("${model.urlDriverImmage ?? ""}"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
