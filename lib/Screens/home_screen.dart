

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController txtName = TextEditingController(text: 'Mayuri');
TextEditingController txtGrid = TextEditingController(text: '5464');
TextEditingController txtStd = TextEditingController(text: '12');

File? fileImage;
ImagePicker imagePicker = ImagePicker();
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: Icon(Icons.menu),
          centerTitle: true,
          title: Text('Student data',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(studentList.length, (index) =>  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                          borderRadius: BorderRadiusDirectional.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(radius:50,backgroundImage:  (fileImage != null) ? FileImage(fileImage!) : null,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText('Name : ${studentList[index].name}',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text('GRID : ${studentList[index].grid}',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                ),),
                                Text('Std : ${studentList[index].std}',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                ),),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                IconButton(onPressed: () {
                                  studentList.add(Student(
                                    name: txtName.text,
                                    std: txtStd.text,
                                    grid: txtGrid.text,
                                  ));
                                  Navigator.of(context).pushNamed('/update');
                                }, icon: Icon(Icons.edit,color: Colors.black45,size: 25,)),
                                IconButton(onPressed: () {
                                  setState(() {
                                    studentList.removeAt(index);
                                  });
                                }, icon: Icon(Icons.delete,color: Colors.black45,size: 25,)),
                              ],
                            )

                          ],
                        ),
                      ),
                    )

                  //   ListTile(


                  // )
                ),)

              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {

            Navigator.of(context).pushNamed('/detail');
            studentList.add(Student(
              name: txtName.text,
              std: txtStd.text,
              grid: txtGrid.text,
            ));
          },child: Icon(Icons.add),
        ),
      ),

    );
  }
}
