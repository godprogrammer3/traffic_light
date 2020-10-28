import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/ui/smart_widget/image_display/image_display.dart';

import 'login_viewmodel.dart';

class LoginView extends HookWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: LoadingOverlay(
                  isLoading: model.isBusy,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Traffic Light",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 50),
                                ),
                                ImageDisplay(
                                  imageName: 'traffic_icon.png',
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                )
                              ]),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 300,
                                        height: 50,
                                        child: TextFormField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                              suffixIcon:
                                                  Icon(Icons.account_circle),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[900])),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              hintText: 'Email'),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 300,
                                          height: 50,
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: model.isPasswordHidden,
                                            decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                      (model.isPasswordHidden)
                                                          ? Icons.visibility_off
                                                          : Icons.visibility),
                                                  onPressed: () {
                                                    model.setPasswordHidden(
                                                        !model
                                                            .isPasswordHidden);
                                                  },
                                                ),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.grey[900])),
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                hintText: 'Password'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                onPressed: () {
                                  model.logIn(
                                      email: emailController.text,
                                      password: passwordController.text);
                                },
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                color: Colors.green,
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => LoginViewModel());
  }
}
