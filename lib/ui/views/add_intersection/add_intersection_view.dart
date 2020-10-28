import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';

import 'add_intersection_viewmodel.dart';

class AddIntersectionView extends HookWidget {
  const AddIntersectionView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String intersectionId = ModalRoute.of(context).settings.arguments;
    var nameController = useTextEditingController();
    return ViewModelBuilder<AddIntersectionViewModel>.reactive(
        builder: (context, model, child) => WillPopScope(
              onWillPop: () async {
                model.goToHomePage();
                return true;
              },
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        model.goToHomePage();
                      }),
                  title: Text(
                    'Add intersection',
                    style: TextStyle(color: Colors.white, fontSize: 30),
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
                          key: model.formkey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 300,
                                    height: 70,
                                    child: TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[900])),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          hintText: 'Name'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter name';
                                        } else if (value.length < 3 ||
                                            value.length > 20) {
                                          return 'Name must has length between 3 and 20';
                                        }
                                        return null;
                                      },
                                    ),
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
                                        EdgeInsets.fromLTRB(52, 10, 52, 10),
                                    onPressed: () {
                                      if (model.formkey.currentState
                                          .validate()) {
                                        model.addIntersection(
                                          intersectionId: intersectionId,
                                          intersectionName: nameController.text,
                                        );
                                      }
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
                                      model.goToHomePage();
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
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => AddIntersectionViewModel());
  }
}
