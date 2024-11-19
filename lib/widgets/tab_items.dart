import 'package:flutter/material.dart';
import 'package:instagram/utils/list_of_things.dart';
import 'package:velocity_x/velocity_x.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: ListOfThings.randomImages.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3), itemBuilder: (context, index) {
        return Container(
            clipBehavior: Clip.antiAlias,
            height: 124,
            width: 124,
            decoration: BoxDecoration(
                border: Border.all(color: context.primaryColor, width: 1)
            ),
            child: Image.network(ListOfThings.randomImages[index],fit: BoxFit.cover,),);
      },),
    );
  }
}

class Tagged extends StatelessWidget {
  const Tagged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: ListOfThings.randomImages.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3), itemBuilder: (context, index) {
        return Container(
          clipBehavior: Clip.antiAlias,
          height: 124,
          width: 124,
          decoration: BoxDecoration(
              border: Border.all(color: context.primaryColor, width: 1)
          ),
          child: Image.network(ListOfThings.randomImages[index],fit: BoxFit.cover,),);
      },),
    );
  }
}

