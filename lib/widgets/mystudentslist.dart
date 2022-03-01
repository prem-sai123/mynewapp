import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/masterstudent.dart';

class MyStudentsList extends StatelessWidget {
  final List<MasterStudent> students;
  final Function removeStuRecord;
  const MyStudentsList(this.students,this.removeStuRecord);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            color: Colors.tealAccent,
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: FittedBox(
                    child: Text(
                      students[index].studentCGPA.toString(),
                    ),
                  ),
                ),
              ),
              title: Text(
                students[index].studentName!,
              ),
              subtitle: Text(
                DateFormat('yyyy-MM-dd').format(
                  students[index].joiningDate!,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => removeStuRecord(students[index].studentId),
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
