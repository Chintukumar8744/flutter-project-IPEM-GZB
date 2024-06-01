import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/bca/select_semester.dart';

Decoration bodycolor =const BoxDecoration(
    gradient:LinearGradient(colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
    ]));

class Coursepage extends StatefulWidget {
  @override
  State<Coursepage> createState() => _CoursepageState();
}

class _CoursepageState extends State<Coursepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
            title: const Text(
              'IPEM NOTES',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_callback_rounded,
                        color: Colors.red,
                      ),
                      // Text(""),
                    ],
                  ))
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color(0XFFf6d365), Color(0XFFfda085)])),
            )),
        body: Container(
          decoration: bodycolor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
               const SizedBox(
                  height: 30,
                ),
               const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Select your Course",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blue,
                        width: 5,
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BCASelectSemester(),
                                ));
                          },
                          child: Center(
                              child: Text(
                                "B.C.A",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/select_courses_page/img_1.png"),
                              fit: BoxFit.cover,
                            ),
                            border: Border(
                              left: BorderSide(
                                //                   <--- left side
                                color: Colors.blue,
                                width: 3.0,
                              ),
                              right: BorderSide(
                                //                    <--- top side
                                color: Colors.blue,
                                width: 3.0,
                              ),
                            )),
                        width: 100,
                        // child: Image.asset("assets/images/img_1.png"),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>));
                          },
                          child: Center(
                              child: Text(
                                "M.C.A",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.red,
                        width: 5,
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Hello world");
                          },
                          child: Center(
                              child: Text(
                                "B.B.A",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/select_courses_page/img_2.png"),
                              fit: BoxFit.cover,
                            ),
                            border: Border(
                              left: BorderSide(
                                //                   <--- left side
                                color: Colors.red,
                                width: 3.0,
                              ),
                              right: BorderSide(
                                //                    <--- top side
                                color: Colors.red,
                                width: 3.0,
                              ),
                            )),
                        width: 100,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Hello world");
                          },
                          child: Center(
                              child: Text(
                                "L.L.B",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.lightGreenAccent,
                        width: 5,
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Hello world");
                          },
                          child: Center(
                              child: Text(
                                "B.A L.L.B",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/select_courses_page/img_3.png"),
                              fit: BoxFit.cover,
                            ),
                            border: Border(
                              left: BorderSide(
                                //                   <--- left side
                                color: Colors.lightGreenAccent,
                                width: 3.0,
                              ),
                              right: BorderSide(
                                //                    <--- top side
                                color: Colors.lightGreenAccent,
                                width: 3.0,
                              ),
                            )),
                        width: 100,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Hello world");
                          },
                          child: Center(
                              child: Text(
                                "B.COM L.L.B",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5,
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Hello world");
                          },
                          child: Center(
                              child: Text(
                                "B..J.M.C",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/select_courses_page/img_4.png"),
                              fit: BoxFit.cover,
                            ),
                            border: Border(
                              left: BorderSide(
                                //                   <--- left side
                                color: Colors.yellow,
                                width: 3.0,
                              ),
                              right: BorderSide(
                                //                    <--- top side
                                color: Colors.yellow,
                                width: 3.0,
                              ),
                            )),
                        width: 100,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Hello world");
                          },
                          child: Center(
                              child: Text(
                                "M.J.M.C",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
