import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './widgets/newstudent.dart';
import 'models/masterstudent.dart';
import 'widgets/mystudentslist.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MyApplication',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MasterStudent> _myStudentList = [
    MasterStudent(
      studentId: 'R161778',
      studentName: 'SAI',
      studentAge: 21,
      studentCGPA: 8.4,
      joiningDate: DateTime.now(),
    ),
    MasterStudent(
      studentId: 'R161779',
      studentName: 'JOHN',
      studentAge: 99,
      studentCGPA: 9.9,
      joiningDate: DateTime.now(),
    ),
  ];
  void _registerNewStudent(String regStuId, String regStuName, int regStuAge,
      double regStuCgpa, DateTime regStujoinDate) {
    final newSD = MasterStudent(
      studentId: regStuId,
      studentName: regStuName,
      studentAge: regStuAge,
      studentCGPA: regStuCgpa,
      joiningDate: regStujoinDate,
    );
    setState(() {
      _myStudentList.add(newSD);
    });
  }

  void _startRegisterNewStudent(BuildContext ctxt) {
    showModalBottomSheet(
        context: ctxt,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewStudent(_registerNewStudent),
            behavior: HitTestBehavior.opaque,
          );
        });
  }
  void _deleteStudentRecord(String id) {
    setState(() {
      _myStudentList.removeWhere((newSD) => newSD.studentId == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('MyApplication'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startRegisterNewStudent(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: 30,
              child: const Card(
                child: Text(
                  'My Top Bar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.black12,
                elevation: 6,
              ),
            ),
            MyStudentsList(_myStudentList,_deleteStudentRecord),
          ],
        ),
      ),
    );
  }
}
