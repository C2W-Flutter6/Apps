//To Do App UI is further imporved in this code.
//It consists of the Model class

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State createState() => _ToDoAppState();
}

class _ToDoAppState extends State {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void showBottomSheet(bool doEdit, [ToDoModelClass? toDoModelObj]) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        isDismissible: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Title",
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(0, 139, 148, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.purpleAccent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Description",
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(0, 139, 148, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: const Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.purpleAccent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Date",
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(0, 139, 148, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: dateController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: const Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.purpleAccent),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2025),
                        );
                        String formatedDate =
                            DateFormat.yMMMd().format(pickedDate!);
                        setState(() {
                          dateController.text = formatedDate;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
                    ),
                    onPressed: () {
                      doEdit ? submit(doEdit, toDoModelObj) : submit(doEdit);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Submit",
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        });
    void clearController() {
      titleController.clear();
      dateController.clear();
      descriptionController.clear();
    }

    var listOfColors = [
      const Color.fromARGB(255, 243, 165, 165),
      const Color.fromARGB(255, 143, 172, 244),
      const Color.fromARGB(255, 238, 235, 185),
      const Color.fromARGB(255, 242, 204, 242),
    ];

    List<ToDoModelClass> todoList = [
      ToDoModelClass(
        title: "Take Notes",
        description: "Take notes of every app you write",
        date: "10 July 2023",
      ),
      ToDoModelClass(
        title: "Arrange Meeting",
        description: "Meet the backend team",
        date: "10 July 2023",
      ),
    ];

    void submit(bool doEdit, [ToDoModelClass? toDoModelObj]) {
      if (titleController.text.trim().isNotEmpty &&
          descriptionController.text.trim().isNotEmpty &&
          dateController.text.trim().isNotEmpty) {
        if (!doEdit) {
          setState(() {
            todoList.add(
              toDoModelClass(
                title: titleController.text.trim(),
                description: descriptionController.text.trim(),
                date: dateController.text.trim(),
              ),
            );
          });
        } else {
          setState(() {
            toDoModelObj!.date = dateController.text.trim();
            toDoModelObj.title = titleController.text.trim();
            toDoModelObj.description = descriptionController.text.trim();
          });
        }
      }
      clearController();
    }

    void removeTasks() {
      setState(() {
        todoList.remove(toDoModelObj);
      });
    }

    void editTask(ToDoModelClass toDoModelObj) {
      setState(() {
        titleController.text = toDoModelObj.title;
        descriptionController.text = toDoModelObj.description;
        dateController.text = toDoModelObj.date;

        showBottomSheet(true, toDoModelObj);
      });
      @override
      void dispose() {
        super.dispose();
        titleController.dispose();
        dateController.dispose();
        descriptionController.dispose();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
              centerTitle: true,
              title: Text(
                "TO DO APP UI",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 16,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: listOfColors[index % listOfColors.length],
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 10),
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          //1
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/image.png"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "toDoList[index].title",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "toDoList[index].description",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color:
                                            const Color.fromRGBO(84, 84, 84, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          //2
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "toDoList.date",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(132, 132, 132, 1),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        editTask(toDoList[index]);
                                      },
                                      child: const Icon(
                                        Icons.edit_outlined,
                                        color: const Color.fromRGBO(
                                            0, 139, 148, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        removeTasks(toDoList[index]);
                                      },
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Color.fromRGBO(0, 139, 148, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
              onPressed: () {
                clearController();
                showBottomSheet(false);
              },
              child: const Icon(
                size: 50,
                Icons.add,
                color: Colors.white,
              ),
            ));
      }
    }
  }
}
