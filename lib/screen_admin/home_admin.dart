import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:project4/screen_admin/account_admin.dart';
import 'package:project4/screen_admin/lesson_admin.dart';
import 'package:project4/screen_admin/statistical_admin.dart';
import 'package:project4/screen_admin/topic_admin.dart';

import '../controllers/account_admin_controller.dart';

class HomeAdmin extends StatefulWidget {
  final int id_user;
  const HomeAdmin({super.key, required this.id_user});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  List<dynamic> accounts = [];

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await AccountController.getAccountId(widget.id_user);

      setState(() {
        accounts = data ;
      });
    } catch (e) {
      print('Error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100]!.withOpacity(0.3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Home Manager - ${accounts[0]['name']}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    //padding: EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('${accounts[0]['avatar']}'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Container(
              //   alignment: Alignment.topLeft,
              //   child: Text('Find your information!!!'),
              // )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.4 , 100),

                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AccountAdmin()
                          )
                      );
                    },

                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              child: Image(image: AssetImage('abc1.jpg'),)
                          ),
                          SizedBox(height: 5,),
                          Text('Manager Account',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TopicAdmin(id_user: 1,)
                          )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.4 , 80),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              child: Image(image: AssetImage('Book.png'),)
                          ),
                          SizedBox(height: 5,),
                          Text('Manager Topic',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LessonAdmin()
                          )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.4 , 80),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              child: Image(image: AssetImage('question.jpg'),)
                          ),
                          SizedBox(height: 5,),
                          Text('Manager lesson',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StatisticalAdmin()
                          )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.4 , 80),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              child: Image(image: AssetImage('hoicham2.png'),)
                          ),
                          SizedBox(height: 5,),
                          Text('Statistical',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )


        // child: GridView(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     mainAxisSpacing:10,
        //     crossAxisSpacing:10,
        //     // childAspectRatio:1,
        //     mainAxisExtent: 200
        // ),
        //   children: [
        //     ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.white,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30)
        //         ),
        //         minimumSize: Size(MediaQuery.of(context).size.width , 70),
        //
        //       ),
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => AccountAdmin()
        //             )
        //         );
        //       },
        //
        //       child: Container(
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Container(
        //               width: 100,
        //               height: 100,
        //               child: Image(image: AssetImage('abc1.jpg'),)
        //             ),
        //             SizedBox(height: 5,),
        //             Text('Manager Account',
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.bold
        //               ),
        //               )
        //           ],
        //         ),
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => TopicAdmin()
        //             )
        //         );
        //       },
        //       style: ElevatedButton.styleFrom(
        //           backgroundColor: Colors.white,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(30)
        //           )
        //       ),
        //       child: Container(
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Container(
        //                 width: 100,
        //                 height: 100,
        //                 child: Image(image: AssetImage('Book.png'),)
        //             ),
        //             SizedBox(height: 5,),
        //             Text('Manager Topic',
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.bold
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => LessonAdmin()
        //             )
        //         );
        //       },
        //       style: ElevatedButton.styleFrom(
        //           backgroundColor: Colors.white,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(30)
        //           )
        //       ),
        //       child: Container(
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Container(
        //                 width: 100,
        //                 height: 100,
        //                 child: Image(image: AssetImage('question.jpg'),)
        //             ),
        //             SizedBox(height: 5,),
        //             Text('Manager lesson',
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.bold
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => StatisticalAdmin()
        //             )
        //         );
        //       },
        //       style: ElevatedButton.styleFrom(
        //           backgroundColor: Colors.white,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(30)
        //           )
        //       ),
        //       child: Container(
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Container(
        //                 width: 100,
        //                 height: 100,
        //                 child: Image(image: AssetImage('hoicham2.png'),)
        //             ),
        //             SizedBox(height: 5,),
        //             Text('Statistical',
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.bold
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //
        //   ],
        //
        //
        // ),
      ),
    );


  }
}