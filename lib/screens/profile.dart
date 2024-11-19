import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/post.dart';
import 'package:instagram/utils/list_of_things.dart';
import 'package:instagram/widgets/tab_items.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
   Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "Aman_Kevat".text.color(context.theme.primaryColorDark).bold.make(),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.menu,
                color: context.theme.primaryColorDark,
                size: 30,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(ListOfThings.personImages[0]),
                  ),
                ),
                Column(
                  children: [
                    "870".text.xl2.color(context.theme.primaryColorDark).bold.make(),
                    "Posts".text.color(context.theme.primaryColorDark).lg.make(),
                  ],
                ),
                Column(
                  children: [
                    "51".text.xl2.bold.color(context.theme.primaryColorDark).make(),
                    "Followers".text.color(context.theme.primaryColorDark).lg.make(),
                  ],
                ),
                Column(
                  children: [
                    "230".text.xl2.color(context.theme.primaryColorDark).bold.make(),
                    "Following".text.color(context.theme.primaryColorDark).lg.make(),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Aman Kevat".text.lg.bold.make(),
                    "Android Developer".text.color(context.theme.primaryColorDark).lg.make(),
                    "working still need, a break".text.color(context.theme.primaryColorDark).lg.make(),
                  ],
                ).pOnly(left: 20),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: context.theme.primaryColorDark)),
                    height: 40,
                    child: "Edit Profile".text.color(context.theme.primaryColorDark).lg.make(),
                  ).pOnly(left: 10),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: context.theme.primaryColorDark)),
                    height: 40,
                    child: "Share Profile".text.color(context.theme.primaryColorDark).lg.make(),
                  ).pOnly(right: 10),
                ),
              ],
            ),
            SizedBox(height: 20,),

            UiHelper.listView(
                context: context,
                imageData: ListOfThings.personImages,
                textData: ListOfThings.personName),

            Container(
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(icon: Icon(Icons.grid_on,size: 30,)),
                  Tab(icon: Icon(CupertinoIcons.person_crop_square,size: 35,)),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: context.theme.primaryColorDark,
                unselectedLabelColor: Colors.grey,
                indicatorColor: context.theme.primaryColorDark,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // Posts tab content
                  Posts(),
                  // Tagged tab content
                  Tagged(),
                ],
              ),
            ),
          ],
        ));
  }
}
