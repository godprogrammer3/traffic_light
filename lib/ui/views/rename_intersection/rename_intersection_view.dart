import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:traffic_light/datamodel/intersection.dart';

import 'rename_intersection_viewmodel.dart';

class RenameIntersectionView extends HookWidget {
  const RenameIntersectionView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Intersection intersection = ModalRoute.of(context).settings.arguments;
    var nameController = useTextEditingController();
    return ViewModelBuilder<RenameIntersectionViewModel>.reactive(
        onModelReady: (model) {
          model.setIntersection(intersection);
        },
        fireOnModelReadyOnce: true,
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(
                  'Rename intersection',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              body: SingleChildScrollView(
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
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[900])),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: model.intersection.name),
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
                                padding: EdgeInsets.fromLTRB(52, 10, 52, 10),
                                onPressed: () {
                                  model.updateIntesectionName(
                                      name: nameController.text);
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
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
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
                ),
              ),
            ),
        viewModelBuilder: () => RenameIntersectionViewModel());
  }
}
