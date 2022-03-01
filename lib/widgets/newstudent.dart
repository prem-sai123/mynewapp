import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class NewStudent extends StatefulWidget {
  final Function regStu;
  const NewStudent(this.regStu);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  final inputStuId = TextEditingController();
  final inputStuName = TextEditingController();
  final inputStuAge = TextEditingController();
  final inputStuCGPA = TextEditingController(text: 0.0.toString());
  DateTime? _inputStujoinDate;

  void registerStudentData() {
    final enteredStuId = inputStuId.text;
    final enteredStuName = inputStuName.text;
    final enteredStuAge = int.parse(inputStuAge.text, onError: (source) => -1);
    final enteredStuCGPA = double.parse(inputStuCGPA.text);
    if (enteredStuId.length < 6) {
      Fluttertoast.showToast(
        msg: "Invalid ID length",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
      );
    } else {
      widget.regStu(
          enteredStuId, enteredStuName, enteredStuAge, enteredStuCGPA,_inputStujoinDate);
    }
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _inputStujoinDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Student Id'),
              ),
              controller: inputStuId,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Student Name'),
              ),
              controller: inputStuName,
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_box,
                          size: 20,
                        ),
                        labelText: 'Age',
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: inputStuAge,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 5),
                    width: 200,
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.art_track,
                          size: 20,
                        ),
                        labelText: 'CGPA',
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: inputStuCGPA,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => registerStudentData(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_inputStujoinDate == null
                        ? 'No Date Chosen'
                        : DateFormat.yMMMd()
                            .format(_inputStujoinDate!)
                            .toString()),
                  ),
                  FlatButton(
                    onPressed: _showDatePicker,
                    child: const Text(
                      'Select Date',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              child: const Text(
                'Register Student',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: registerStudentData,
            ),
          ],
        ),
      ),
    );
  }
}
