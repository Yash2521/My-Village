import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {

  File? pickedImage;

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Select Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo, width: 5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      child: pickedImage !=null ? Image.file(pickedImage!,
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,) :
                       Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: imagePickerOption,
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton.icon(
            //       onPressed: (){},
            //       icon: const Icon(Icons.add_a_photo_sharp),
            //       label: const Text('UPLOAD IMAGE')),
            // )

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    labelText:"Full Name",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w800,
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.email_outlined),
                    labelText:"Enter Email",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w800,
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: InputDecoration(

                    prefixIcon: Icon(Icons.home_work_outlined),
                    labelText:"Home Location",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w800,
                    )
                ),
              ),
            ),
            Container(

              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: TextField(
                obscureText: true,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText:"Password",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w800,
                    )
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xff3957ed)),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, 'home');
                  },
                  child: Text("Update Details",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                ),
              ],
            )

          ],
        ),
      ),
    );

  }
}
