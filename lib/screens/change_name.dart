import 'package:flutter/material.dart';

class ChangeName extends StatefulWidget {
  @override
  _ChangeNameState createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  final nameController = TextEditingController();
  String _name = 'Kasper';
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFB8B8),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 150,),
                Container(
                  margin: EdgeInsets.fromLTRB(0,20,0,0),
                  padding: EdgeInsets.all(40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        focusColor: Colors.pinkAccent
                      ),
                  controller: nameController,
                )),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _name = nameController.text;
                        });
                        Navigator.pop(
                            context,
                            ({
                              'name': _name,
                            }));
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.black, fontSize: 32),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Back",
                        style: TextStyle(color: Colors.black, fontSize: 32),
                      )),
                  SizedBox(height: 100)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
