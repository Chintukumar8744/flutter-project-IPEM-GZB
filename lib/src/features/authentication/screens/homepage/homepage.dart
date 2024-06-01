import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipemnotesapp/src/common_widgets/roundedbutton.dart';

import 'package:ipemnotesapp/src/features/authentication/screens/homepage/Aboutus.dart';
import 'package:ipemnotesapp/src/common_widgets/drawer.dart';
import 'package:ipemnotesapp/src/features/authentication/screens/homepage/coursepage.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:url_launcher/url_launcher.dart';
class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

Decoration myDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(colors: [
      Color(0xff4facfe),
      Color(0xff00f2fe),
    ]));

class _HomepageState extends State<Homepage> {

  PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> _images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYon4H9RNT0MGeaTdup0zUzkcv1yNPe8-pskaVwERZ0Q&s",
    "https://law.ipemgzb.ac.in/wp-content/uploads/2023/06/14_4912x2760.png",
    "https://law.ipemgzb.ac.in/wp-content/uploads/2023/06/IMG_5651_4912x2760.jpg",
  ];
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }
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
      // body: Container(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(width: double.infinity, height: 200, child: VideoApp()),
      //       ),
      //       Container(
      //         width: double.infinity,
      //         height: double.infinity,
      //         color: Colors.red,
      //       )
      //     ],
      //   ),
      // ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffff9a9e),
                Color(0xfffad0c4),
              ])),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     Expanded(
                //         child: Image.asset(
                //       "assets/images/img_5.png",
                //       fit: BoxFit.cover,
                //     )),
                //   ],
                // ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
                  child: Row(
                    children: [
                      Roundedbutton(
                          btnName: "Courses",
                          icon: Icon(Icons.book,size:40 ),
                          callBack: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Coursepage(),
                                ));
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Roundedbutton(
                          btnName: "Alumni Association",
                          icon: Icon(Icons.account_box_outlined,size: 40,),
                          callBack: () {
                            print("hellow world");
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
                  child: Row(
                    children: [
                      Roundedbutton(
                          btnName: "IPEM Gallery",
                          icon: Icon(Icons.panorama,size: 40,),
                          callBack: () {
                            launchUrlString("https://law.ipemgzb.ac.in/gallery/");
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Roundedbutton(
                          btnName: "Examination",
                          icon: Icon(Icons.co_present,size: 40,),
                          callBack: () {
                            launchUrlString("https://www.ccsuniversity.ac.in/ccsum/");
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
                  child: Row(
                    children: [
                      Roundedbutton(
                          btnName: "About us",
                          icon: Icon(Icons.account_box_outlined,size: 40,),
                          callBack: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutus(),));
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      Roundedbutton(
                          btnName: "Ask Question",
                          icon: Icon(Icons.add_task,size: 40,),
                          callBack: () {
                            print("hellow world");
                          }),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _images.length; i++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
