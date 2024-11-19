import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/utils/list_of_things.dart';
import 'package:instagram/utils/routes.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class Message extends StatelessWidget {
  Message({super.key});

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(CupertinoIcons.back, size: 30,),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.bottomNav);
          },
        ),
        title: "Aman_Kevat".text.bold.make(),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              CupertinoIcons.square_pencil,
              size: 35,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.center,
              height: 36,
              width: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.canvasColor),
              child: UiHelper.customTextFieldSearch(
                  context: context,
                  text: "Search",
                  controller: search,
                  icon: Icons.search),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ListOfThings.personImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(ListOfThings.personImages[index]),
                    ),
                  ),
                  title: ListOfThings.personName[index].text.color(context.theme.primaryColorDark).make(),
                  subtitle: "have a nice day bro".text.gray400.make(),
                  trailing: Icon(
                    CupertinoIcons.camera,
                    color: context.theme.primaryColorLight,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: SizedBox(
      //   height: 60,
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(backgroundColor: context.theme.primaryColor),
      //       onPressed: () {},
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Icon(
      //             Icons.camera_alt,
      //             color: Colors.blue,
      //             size: 35,
      //           ),
      //           SizedBox(width: 10,),
      //           "Camera".text.lg.blue400.make(),
      //         ],
      //       )),
      // ),
    );
  }
}
