import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_mobile/mobile_admin/web_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lawyer_mobile/models/lawyer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class AddLawyer extends StatelessWidget {
  AddLawyer({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController starsController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController profileController = TextEditingController();

  chooseImage() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    String uploadedPhotoUrl = "";
    Reference _reference = _firebaseStorage
        .ref()
        .child('images/${Path.basename(pickedFile!.path)}');
    await _reference
        .putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    )
        .whenComplete(() async {
      await _reference.getDownloadURL().then((value) {
        uploadedPhotoUrl = value;
      });
    });

    profileController.text = uploadedPhotoUrl;
  }

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(hintText: "name"),
          ),
          TextFormField(
            controller: bioController,
            decoration: InputDecoration(hintText: "bio"),
          ),
          TextFormField(
            controller: starsController,
            decoration: InputDecoration(hintText: "stars"),
          ),
          TextFormField(
            controller: categoryController,
            decoration: InputDecoration(hintText: "category"),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: profileController,
                  enabled: false,
                  decoration: InputDecoration(hintText: "profile Image"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    chooseImage();
                  },
                  child: Text("Upload"))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Lawyer testLawyer = Lawyer(
                    id: "",
                    name: nameController.text,
                    bio: bioController.text,
                    category: categoryController.text,
                    rating: starsController.text,
                    profileImageURL: profileController.text);
                FirebaseFirestore fs = FirebaseFirestore.instance;
                fs.collection('lawyers').add(testLawyer.toMap());
              },
              child: Text("Add Lawyer")),
        ],
      ),
    );
  }
}
