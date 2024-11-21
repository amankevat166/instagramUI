import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/getx_controller/meme_controller.dart';
import 'package:instagram/screens/login.dart';
import 'package:instagram/utils/list_of_things.dart';
import 'package:instagram/utils/routes.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final MemeController controller = Get.put(MemeController());
  List<String> subTitle = [
    "Tokyo, Japan",
    "Paris, France",
    "Berlin, Germany",
    "Sydney, Australia",
    "Cairo, Egypt",
    "Moscow, Russia",
    "Toronto, Canada",
    "New York, USA",
    "Beijing, China",
    "Rio de Janeiro, Brazil",
    "Cape Town, South Africa",
    "Rome, Italy",
    "Mumbai, India",
    "Seoul, South Korea",
    "Dubai, United Arab Emirates",
    "Bangkok, Thailand",
  ];
  var meme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchMemes();
    meme = controller.memes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(CupertinoIcons.camera,color: VxContextExtensions(context).theme.primaryColorDark,),
          title: "Instagram"
              .text
              .textStyle(GoogleFonts.satisfy())
              .color(VxContextExtensions(context).theme.primaryColorDark)
              .bold
              .xl3
              .make(),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.heart,size: 30,color: VxContextExtensions(context).theme.primaryColorDark,)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.message);
                },
                icon: Image.asset(
                  "assets/images/messanger.png",
                  color: VxContextExtensions(context).theme.primaryColorDark,
                )),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              UiHelper.listView(
                  context: context,
                  imageData: ListOfThings.personImages,
                  textData: ListOfThings.personName),


              UiHelper.listviewHome(
                  images: ListOfThings.personImages,
                  name: ListOfThings.personName,
                  subTitle: subTitle,
              meme: meme,
              controller: controller),
            ],
          ),
        ));
  }
}
