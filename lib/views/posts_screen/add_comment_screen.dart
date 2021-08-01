

import 'package:flutter/material.dart';
import 'package:test_eclipse/widgets/gradient_app_bar.dart';

class AddCommentScreen extends StatelessWidget {
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0B21),
      body: Column(
        children: [
          GradientAppBar(title: '',),
          SizedBox(height: 10,),
          TextField(
            enabled: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                contentPadding: EdgeInsets.all(16),
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white)),
            style: TextStyle(color: Colors.white),
            controller: _nameEditingController,
          ),
          SizedBox(height: 10,),
          TextField(
            enabled: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                contentPadding: EdgeInsets.all(16),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white)),
            style: TextStyle(color: Colors.white),
            controller: _emailEditingController,
          ),
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            enabled: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)),
                contentPadding: EdgeInsets.all(16),
                labelText: 'Text',
                labelStyle: TextStyle(color: Colors.white)),
            style: TextStyle(color: Colors.white),
            controller: _textEditingController,
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color(0xff6C63FF),
              height: 50,
              width: double.maxFinite,
              child: FlatButton(
                height: MediaQuery.of(context).size.height,
                onPressed: () {
                  if(_nameEditingController.text.isNotEmpty && _emailEditingController.text.isNotEmpty && _textEditingController.text.isNotEmpty){
                    Navigator.pop(context);
                  } else {
                    return Container();
                  }
                },
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
