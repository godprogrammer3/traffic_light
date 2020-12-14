import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/datamodel/intersection.dart';

import 'change_password_viewmodel.dart';

class ChangePasswordView extends HookWidget {
  const ChangePasswordView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var oldPasswordController = useTextEditingController();
    var newPasswordController = useTextEditingController();
    var confirmPasswordController = useTextEditingController();
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
        fireOnModelReadyOnce: true,
        builder: (context, model, child) => WillPopScope(
            onWillPop: () {
              model.back();
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      model.back();
                    }),
                title: Text(
                  'Change password',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              body: LoadingOverlay(
                isLoading: model.isBusy,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: model.formKey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 70,
                                    child: TextFormField(
                                      controller: oldPasswordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[900])),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: 'Old password',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter old password';
                                        } else if (value.length < 6) {
                                          return 'Password must has length more than 5';
                                        }
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 300,
                                      height: 70,
                                      child: TextFormField(
                                        controller: newPasswordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900])),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            hintText: 'New password'),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter new password';
                                          } else if (value.length < 6) {
                                            return 'Password must has length more than 5';
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 300,
                                      height: 70,
                                      child: TextFormField(
                                        controller: confirmPasswordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900])),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            hintText: 'Confirm new password'),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter confirm password';
                                          } else if (value.length < 6) {
                                            return 'Password must has length more than 5';
                                          } else if (value !=
                                              newPasswordController.text) {
                                            return 'Confirm password not same as new password';
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RaisedButton(
                                    padding:
                                        EdgeInsets.fromLTRB(52, 10, 52, 10),
                                    onPressed: () {
                                      model.updatePassword(
                                          oldPassword:
                                              oldPasswordController.text,
                                          newPassword:
                                              newPasswordController.text);
                                    },
                                    child: Text(
                                      'SAVE',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    color: Colors.green,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RaisedButton(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    onPressed: () {
                                      model.back();
                                    },
                                    child: Text(
                                      'CANCEL',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    color: Colors.green,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )),
        viewModelBuilder: () => ChangePasswordViewModel());
  }
}
