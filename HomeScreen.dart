import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yt_project/signature_pad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Uint8List? signatureImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            signatureImage == null
                ? Text('Add Your Signature', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)
                :Image.memory(signatureImage!,
                 height: MediaQuery.of(context).size.width,
                 width: MediaQuery.of(context).size.width,
                 fit: BoxFit.fill,),

            SizedBox(height: 20.0,),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding:
                    MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () async {
                  signatureImage = await Navigator.push(context, MaterialPageRoute(builder: (context)=>SignatureScreen()));

                  setState(() {});
                },
                child: const Text('Add Signature')),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
