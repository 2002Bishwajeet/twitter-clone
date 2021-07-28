import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:twitter_clone/themes.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfilePage extends ConsumerWidget {
  CreateProfilePage({Key? key}) : super(key: key);
  final TextEditingController _name = TextEditingController();
  final TextEditingController _handle = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  // Pick an image
  Future<void> pickImage(ImagePicker picker) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = image;
  }

  @override
  Widget build(BuildContext context, ScopedReader ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Form(
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
                                  : AssetImage(_image!.path),
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
                    hintText: 'Twitter Handle',
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
              Container(
                padding: const EdgeInsets.only(top: 48.0),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
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
        ),
      ),
    );
  }
}
