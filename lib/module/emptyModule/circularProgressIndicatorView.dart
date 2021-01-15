import 'package:enerren/component/circularProgressIndicatorComponent.dart';
import 'package:flutter/material.dart';
import 'presenter.dart';

//sample sederhana persenter dan view disatukan
class CircularProgressIndicatorView extends State<Presenter> {
  CircularProgressIndicatorController controller =
      CircularProgressIndicatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 300,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Start Loading"),
                    onPressed: () {
                      controller.startLoading();
                    },
                  ),
                  RaisedButton(
                    child: Text("Stop Loading"),
                    onPressed: () {
                      controller.stopLoading();
                    },
                  ),
                  RaisedButton(
                    child: Text("Stop with message"),
                    onPressed: () {
                      controller.stopLoading(message: "some message");
                    },
                  ),
                  RaisedButton(
                    child: Text("Stop with widget"),
                    onPressed: () {
                      controller.stopLoading(
                        messageWidget: Container(
                          margin: EdgeInsets.only(),
                          height: 50,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text("change background color"),
                    onPressed: () {
                      setState(() {
                        // controller.value.height = 50;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          CircularProgressIndicatorComponent(
            controller: controller,
            aligment: Alignment.bottomCenter,
            messageAligment: Alignment.topCenter,
          )
        ],
      ),
    );
  }
}
