import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/user/bloc/user_blocs.dart';
import 'package:mitane_frontend/domain/user/entity/user_model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/user/screens/UserAdmin_Lists.dart';

// import 'package:mitane_frontend/presentation/pages/common/DropdownComponent.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';
import 'package:mitane_frontend/route_generator.dart';

class AdminUserEdit extends StatefulWidget {
  static const String routeName = '/admin/users/edit';

  final UserArgument argument;
  AdminUserEdit({required this.argument});

  @override
  _AdminUserEditState createState() => _AdminUserEditState();
}

class _AdminUserEditState extends State<AdminUserEdit> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit User",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AdminUsers.routeName);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
        Positioned(
          child: Bubble(
            height: 160.0,
            width: 160.0,
          ),
          top: -5,
          left: -160,
        ),
        Positioned(
          child: Bubble(
            height: 250.0,
            width: 250,
          ),
          top: 130,
          left: 180,
        ),
        SingleChildScrollView(
          child:  Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                  margin: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      TextFormField(
                          initialValue: widget.argument.user.name,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: "User Name",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter user name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              this._user["name"] = value;
                            });
                          }),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                          initialValue: widget.argument.user.phoneNo.toString(),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              labelText: "Phone No",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter user phone number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              this._user["phoneNo"] = value;
                            });
                          }),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                          initialValue: widget.argument.user.roles,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              labelText: "Role", border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter user roles';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              this._user["roles"] = value;
                            });
                          }),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              labelText: "Update Password",
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please enter user password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              this._user["password"] = value;
                            });
                          }),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        MitaneButton(
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              form.save();
                              final UserEvent event = UserAdminUpdate(
                                User(
                                  id: widget.argument.user.id,
                                  name: this._user["name"],
                                  phoneNo: double.parse(this._user["phoneNo"]),
                                  password: this._user["password"],
                                  roles: this._user["roles"],
                                ),
                              );
                              BlocProvider.of<UserBloc>(context).add(event);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AdminUsers.routeName, (route) => false);
                            }
                          },
                          title: "Edit User Profile",
                        )
                      ])
                    ],
                  ))
            ],
          ),
        ))
        )]));
  }
}
