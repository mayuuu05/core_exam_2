import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'home_screen.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.school),
        centerTitle: true,
        title: Text('Add data',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child:    fileImage == null ? const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ) : CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(fileImage!),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  IconButton(onPressed: () async {

                    XFile? xFileImage = await imagePicker.pickImage(source: ImageSource.camera);

                    setState(() {
                      fileImage = File(xFileImage!.path);
                    });
                  }, icon: Icon(Icons.camera_alt,size: 30,)),

                  IconButton(onPressed: () async {
                    XFile? xFileImage = await imagePicker.pickImage(source: ImageSource.gallery);

                    setState(() {
                      fileImage=File(xFileImage!.path);
                    });
                  }, icon: Icon(Icons.photo,size: 30,))
                ],),
              SizedBox(height: 20,),
              TextFormField(
                controller: txtName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  label:Text('Enter name',style: TextStyle(color: Colors.grey),),
                ),

              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: txtStd,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  label:Text('Enter std',style: TextStyle(color: Colors.grey),),
                ),

              ),

              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: txtGrid,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  label:Text('Enter GRID',style: TextStyle(color: Colors.grey),),
                ),

              ),

              SizedBox(height: 50,),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green)
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    }, child: Text('Submit',style: TextStyle(
                  color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),)),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
