import 'package:flutter/material.dart';
import 'package:instagram/themes/theme.dart';
import 'package:instagram/utils/list_of_things.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 36,
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
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/Live.png",
                color: context.theme.primaryColorDark,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          Expanded(
            child: GridView.builder(
              itemCount: ListOfThings.randomImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  height: 124,
                  width: 124,
                  decoration: BoxDecoration(

                    border: Border.all(color: context.primaryColor,width: 1)
                  ),
                  child: Image.network(
                    ListOfThings.randomImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ).pOnly(left: 2,right: 2),
          )
          // Row(
          //   children: [
          //     UiHelper.listView(context: context),
          //     // Container(
          //     //   height: 32,
          //     //   width: 75,
          //     //   decoration: BoxDecoration(
          //     //     border: Border.all(color: context.theme.primaryColorLight),
          //     //   ),
          //     //   child: Row(
          //     //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     //     children: [
          //     //       Image.asset("assets/images/igtv_icon.png",color: context.theme.primaryColorDark,),
          //     //       "IGTV".text.make(),
          //     //     ],
          //     //   ),
          //     // ),
          //   ],
          // ),
        ],
      ),
    ));
  }
}
