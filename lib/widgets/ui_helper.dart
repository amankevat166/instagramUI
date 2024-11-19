import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/models/IconText.dart';
import 'package:instagram/utils/list_of_things.dart';
import 'package:velocity_x/velocity_x.dart';


class UiHelper {
  static customTextField(
      {required BuildContext context,
      required String text,
      required TextEditingController controller,
      required bool toHide,
      required TextInputType textInput,
         String? Function(String?)? validator,}) {
    return Container(
      height: 50,
      width: 343,
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.primaryColorDark),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: toHide,
        keyboardType: textInput,
        validator: validator,
        decoration: InputDecoration(
          hintText: text,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintStyle: context.displaySmall,
          border: InputBorder.none,
        ),
      ),
    );
  }

  static elevatedButton(
      {required BuildContext context,
      required VoidCallback callback,
      required String text}) {
    return SizedBox(
      height: 50,
      width: 343,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade500,
              foregroundColor: Colors.white),
          onPressed: callback,
          child: text.text.make()),
    );
  }

  static richText(
      {required BuildContext context,
      required String text1,
      required String text2,
      required VoidCallback callback}) {
    return RichText(
      text: TextSpan(
          text: text1,
          style: TextStyle(color: context.theme.primaryColorDark),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(color: Colors.blue.shade500),
                recognizer: TapGestureRecognizer()..onTap = callback),
          ]),
    );
  }

  static customTextFieldSearch(
      {required BuildContext context,
      required String text,
      required TextEditingController controller,
      required IconData icon}) {
    return Container(
      height: 50,
      width: 343,
      decoration: BoxDecoration(
        // border: Border.all(color: context.theme.primaryColorDark),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,

          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  static listView({
    required BuildContext context,
    required List<String> imageData,
    required List<String> textData,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListOfThings.personImages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 31,
                    backgroundImage: NetworkImage(
                        imageData[index]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  textData[index].text.color(context.theme.primaryColorDark).bold.sm.make(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static listviewHome(
      {required List<String> images,
      required List<String> name,
      required List<String> subTitle,}) {
    return Expanded(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {

          ValueNotifier<bool> isLiked = ValueNotifier(false);
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(images[index]),
                ),
                title: name[index].text.bold.color(context.theme.primaryColorDark).make(),
                subtitle: subTitle[index].text.sm.color(context.theme.primaryColorDark).make(),
                trailing: Icon(
                  Icons.more_horiz,
                  color: context.theme.primaryColorDark,
                ),
              ),
              Image.network(ListOfThings.randomImages[index]),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isLiked,
                    builder: (context, value, child) {
                      return IconButton(
                        onPressed: () {
                          isLiked.value = !isLiked.value; // Toggle like state
                        },
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(scale: animation, child: child);
                          },
                          child: Icon(
                            value ? Icons.favorite : CupertinoIcons.heart,
                            key: ValueKey(value),
                            color: value ? Colors.pink : context.theme.primaryColorDark,
                            size: 30,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/comment.png",
                    color: context.theme.primaryColorDark,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(

                    "assets/images/messanger.png",
                    color: context.theme.primaryColorDark,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      "assets/images/save.png",
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                ],
              ),
              ListTile(
                  leading: SizedBox(
                    height: 30,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(images.reversed.toList()[index]),
                    ),
                  ),
                  title: RichText(
                    text: TextSpan(
                      text: "Liked by ",
                      style: TextStyle(color: context.theme.primaryColorDark),
                      children: <TextSpan>[
                        TextSpan(
                            text: name.reversed.toList()[index],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: " and 53698 others"),
                      ],
                    ),
                  )),
              "i just create instagram ui i hope you like it also give your reviews also liked my content thank you"
                  .text
                  .medium
                  .make()
                  .px(20),
              SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }

  //Alert dialog
  static Future alertDialog(BuildContext context,String title,String desc){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Ok"))
        ],
      );
    },);
  }
}
