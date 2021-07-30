import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/pages/homepage.dart';
import 'package:twitter_clone/providers/Create_user_provider.dart';
import 'package:twitter_clone/themes.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfilePage extends StatefulWidget {
  CreateProfilePage({Key? key}) : super(key: key);
  static const routename = '/createProfile';

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _handle = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  Future<void> pickImage(ImagePicker picker) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    print(_image!.path);
  }

  bool _isloading = false;
  @override
  void dispose() {
    _name.dispose();
    _handle.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer(builder: (context, watch, _) {
          final _createUser = watch(userProvider);
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Icon(
                    LineIcons.twitter,
                    color: TwitterTheme.blueTColor,
                    size: 40,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Create Your Profile',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      enableFeedback: true,
                      onTap: () => pickImage(_picker),
                      child: Stack(
                        children: [
                          CircleAvatar(
                              radius: 56,
                              backgroundColor: TwitterTheme.blueTColor,
                              child: CircleAvatar(
                                radius: 52,
                                backgroundImage: _image == null
                                    ? NetworkImage(
                                            'https://images.pexels.com/photos/2811087/pexels-photo-2811087.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
                                        as ImageProvider<Object>
                                    : FileImage(File(_image!.path)),
                              )),
                          Positioned(
                            bottom: 2,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: TwitterTheme.blueTColor,
                              radius: 15,
                              child: Icon(
                                Icons.add,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextFormField(
                    autocorrect: true,
                    enableSuggestions: true,
                    controller: _name,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Name',
                      alignLabelWithHint: true,
                      // border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Pls enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextFormField(
                    autocorrect: true,
                    controller: _handle,
                    enableSuggestions: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Twitter handle',
                      alignLabelWithHint: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'It must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Spacer(),
                _isloading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        padding: const EdgeInsets.only(top: 48.0),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _image != null
                                ? await _createUser
                                    .addProfilePicture(
                                        _image!.path, _image!.name)
                                    .then((url) => _createUser.addUser(
                                        _name.text, _handle.text, url))
                                : _createUser.addUser(_name.text, _handle.text,
                                    'assets/images/maleavatar.png');

                            await Navigator.of(context)
                                .pushReplacementNamed(HomePage.routename);
                          },
                          child: Text(
                            'Create User',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          textColor: TwitterTheme.blueTColor,
                          textTheme: ButtonTextTheme.primary,
                          minWidth: 100,
                          padding: const EdgeInsets.all(18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: TwitterTheme.blueTColor),
                          ),
                        ),
                      ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
