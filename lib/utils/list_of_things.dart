import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfThings{
  static List<String> randomImages = [
    "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
    "https://media.istockphoto.com/id/183821822/photo/say.jpg?s=612x612&w=0&k=20&c=kRmCjTzA9cq4amgRgeHkZsZuvxezUtC8wdDYfKg-mho=",
    "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
    "https://media.istockphoto.com/id/183821822/photo/say.jpg?s=612x612&w=0&k=20&c=kRmCjTzA9cq4amgRgeHkZsZuvxezUtC8wdDYfKg-mho=",
    "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
    "https://media.istockphoto.com/id/183821822/photo/say.jpg?s=612x612&w=0&k=20&c=kRmCjTzA9cq4amgRgeHkZsZuvxezUtC8wdDYfKg-mho=",
    "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
    "https://media.istockphoto.com/id/183821822/photo/say.jpg?s=612x612&w=0&k=20&c=kRmCjTzA9cq4amgRgeHkZsZuvxezUtC8wdDYfKg-mho=",
    "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
    "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
    "https://cdn.pixabay.com/photo/2015/03/17/02/01/cubes-677092_1280.png",
    "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
    "https://i.redd.it/i-got-bored-so-i-decided-to-draw-a-random-image-on-the-v0-4ig97vv85vjb1.png?width=1280&format=png&auto=webp&s=7177756d1f393b6e093596d06e1ba539f723264b",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4c1y_7gy2crn2Ll_ZSWzcqb0WDZFuBnFTeQ&s"
  ];

  static List<String> personImages = [
    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s",
    "https://www.shutterstock.com/image-photo/handsome-happy-african-american-bearded-260nw-2460702995.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4xjShh4ynJbrgYrW_aB4lhKSxeMzQ3cO_A&s",
    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s",
    "https://www.shutterstock.com/image-photo/handsome-happy-african-american-bearded-260nw-2460702995.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4xjShh4ynJbrgYrW_aB4lhKSxeMzQ3cO_A&s",
    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s",
    "https://www.shutterstock.com/image-photo/handsome-happy-african-american-bearded-260nw-2460702995.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4xjShh4ynJbrgYrW_aB4lhKSxeMzQ3cO_A&s",
    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s",
    "https://www.shutterstock.com/image-photo/handsome-happy-african-american-bearded-260nw-2460702995.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4xjShh4ynJbrgYrW_aB4lhKSxeMzQ3cO_A&s",
  ];

  static List<String> personName = [
    "Your Story",
    "aelis",
    "aman",
    "harsh",
    "jenil",
    "aelis",
    "aman",
    "harsh",
    "jenil",
    "aelis",
    "aman",
    "harsh",
    "jenil",
    "bro",
    "harry",
    "dhruv"
  ];

  static List<dynamic> highlightImages = [
    Icon(Icons.add),
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s",
    "https://www.shutterstock.com/image-photo/handsome-happy-african-american-bearded-260nw-2460702995.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa4xjShh4ynJbrgYrW_aB4lhKSxeMzQ3cO_A&s",
  ];

  static List<String> highlightText = ["Sports","Friends","Design"];
}