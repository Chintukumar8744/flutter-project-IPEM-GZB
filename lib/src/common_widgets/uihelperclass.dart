import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/features/authentication/controllers/pdf_viewer_page.dart';

class Uihelper{
  static CustomAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
          title: Text(text),
          actions:[
            TextButton(onPressed: (){
              Navigator.pop(context);
            },child: Text("OK"),)
          ]
      );
    });
  }

  Future<String> uploadPdf(String filename,File file)async{
      final refrence =FirebaseStorage.instance.ref().child("pdfs/$filename.pdf");

      final uploadTask=refrence.putFile(file);

      await uploadTask.whenComplete((){});

      final downloadlink=await refrence.getDownloadURL();

      return downloadlink;
  }

  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  List<Map<String,dynamic>> pdfData =[];

  void pickFile()async{
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if(pickedFile !=null){

      String fileName=pickedFile.files[0].name;

      File file=File(pickedFile.files[0].path!);
      final dowloadLInk= await uploadPdf(fileName, file);

     await _firebaseFirestore.collection("pdfs").add({
        "name":fileName,
        "url":dowloadLInk,
      });

     print("Pdf uploaded SucessfullY");
    }

  }

  // void getAllPdf()async{
  //   final results=await _firebaseFirestore.collection("pdfs").get();
  //   pdfData=results.docs.map((e)=>e.data()).toList();
  //   setState((){});
  // }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file,)),
  );



}