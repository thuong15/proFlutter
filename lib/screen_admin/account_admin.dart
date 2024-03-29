import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/account.dart';

import '../controllers/account_admin_controller.dart';
import 'detail_account_admin.dart';

class AccountAdmin extends StatefulWidget {
  const AccountAdmin({super.key});

  @override
  State<AccountAdmin> createState() => _AccountAdminState();
}

class _AccountAdminState extends State<AccountAdmin> {

  List<dynamic> accounts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    try {
      final acc = await AccountController.getAccountInfo();

      // final data1 = await HomeController.getListLesson(idUser,idTopic);
      //
      // final data2 = await HomeController.getDay(idUser);
      setState(() {
        accounts = acc;
        // topic = 'Chủ đề ${data['stt']}';
        // listLesson = data1;
        // totalDay = data2['totalDay'];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     title: Title(color: Colors.blue,
      //         child: Container(
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //
      //                 children: [
      //                   Container(
      //                     padding: EdgeInsets.all(10),
      //                     child: Text('Account Manager'),
      //                   ),
      //                   Container(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: CachedNetworkImage(imageUrl: 'assets/${acc.Avata}',height: 50,width: 50,fit: BoxFit.cover,)),)
      //                 ],),
      //
      //             ],
      //           ),
      //         )
      //     )
      // ),

      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          var acc = accounts[index];
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: CachedNetworkImage(imageUrl: 'assets/${acc['avatar']}',height: 80,width: 80,fit: BoxFit.cover,)),

                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'Name: ${acc['Name']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            softWrap: true,

                          ),
                        ),
                        SizedBox(width: 20,),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.6,
                        //   child: Text(
                        //     'UserName: ${acc.UserName}',
                        //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        //     softWrap: true,
                        //
                        //   ),
                        // ),
                        // SizedBox(width: 20,),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.6,
                        //   child: Text(
                        //     'CreateTime: ${acc.CreateTime}',
                        //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        //     softWrap: true,
                        //
                        //   ),
                        // ),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn lề của hàng theo chiều ngang
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  )
                                  ,onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DetailAccountAdmin(id_user: 1,)
                                    )
                                );
                              }, child: Text('Detail',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),)),
                              SizedBox(width: 20),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  )
                                  ,onPressed: (){}, child: Text('Edit',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),)),
                              SizedBox(width: 20),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  onPressed: (){}, child: Text('Delete',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),)
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                  ],
                )

              ],
            ),
          );
        },

      ),
    );
  }
}

