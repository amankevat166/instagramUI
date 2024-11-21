import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instagram/getx_controller/meme_controller.dart';
import 'package:instagram/themes/theme.dart';
import 'package:instagram/utils/list_of_things.dart';
import 'package:instagram/widgets/ui_helper.dart';
import 'package:instagram/widgets/video_player.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();
  final MemeController controller = Get.put(MemeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchMemes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.resetMemes(); // Reset memes and start from page 1
          controller.fetchMemes();
        },
        child: Icon(Icons.refresh),
      ),

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
                    color: VxContextExtensions(context).theme.primaryColorDark,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  if (controller.memes.isEmpty && !controller.isLoading.value) {
                    return Center(child: Text('No memes found.'));
                  }

                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        controller.fetchMemes(); // Load more memes when reaching the bottom
                      }
                      return false;
                    },
                    child: Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemCount: controller.memes.length + (controller.isLoading.value ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == controller.memes.length) {
                            // Display loading indicator at the end while fetching more memes
                            return Center(child: CircularProgressIndicator());
                          }
                          final meme = controller.memes[index];
                          return GestureDetector(
                            onTap: () => showFullScreenMeme(context, meme), // Show meme fullscreen
                            child: CachedNetworkImage(
                              imageUrl: meme['url'], // Image or Video URL
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}


