import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/getx_controller/firebase_auth_controllers/firebase_methods.dart';
import 'package:instagram/utils/routes.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  var userData;

  @override
  void initState() {
    super.initState();
    FirebaseMethods firebaseMethods = Get.find<FirebaseMethods>();
    firebaseMethods.fetchUserData();
    userData = firebaseMethods.userData;
    nameController.text = userData['Name'];
    userNameController.text = userData['userName'];
    bioController.text = userData['bio'];
  }
  // Method to open the camera
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Method to open the gallery
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Show the popup menu
  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Picture'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.offAllNamed(MyRoutes.bottomNav),
          icon: Icon(Icons.arrow_back,
              color: VxContextExtensions(context).theme.primaryColorDark),
        ),
        title: "Edit Profile"
            .text
            .xl2
            .bold
            .color(VxContextExtensions(context).theme.primaryColorDark)
            .make(),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              width: 120,
              child: InkWell(
                onTap:() => _showImageSourceActionSheet(context),
                child: CircleAvatar(
                  radius: 31,
                  backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                  child: _imageFile == null
                      ? Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.grey[400],
                  )
                      : null,
                ),
              ),
            ),
            "Edit Picture".text.color(Colors.blue).make(),
            const SizedBox(
              height: 30,
            ),
            UiHelper.customTextField(
                context: context,
                text: "name",
                controller: nameController,
                toHide: false,
                textInput: TextInputType.text),
            SizedBox(
              height: 15,
            ),
            UiHelper.customTextField(
                context: context,
                text: "Username",
                controller: userNameController,
                toHide: false,
                textInput: TextInputType.text),
            SizedBox(
              height: 15,
            ),
            UiHelper.customTextField(
                context: context,
                text: "Bio",
                controller: bioController,
                toHide: false,
                textInput: TextInputType.text),
            SizedBox(
              height: 20,
            ),
            UiHelper.elevatedButton(
                context: context, callback: () {
                  final name = nameController.text.trim();
                  final userName = userNameController.text.trim();
                  final bio = bioController.text.trim();
                  FirebaseMethods.updateRegisterData(name,userName,bio);

            }, text: "Save"),
          ],
        ),
      ),
    );
  }
}
