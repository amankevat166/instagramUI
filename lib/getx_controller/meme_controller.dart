import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MemeController extends GetxController {
  var memes = [].obs; // List of meme objects
  var isLoading = false.obs; // To track loading state
  var page = 1.obs; // For pagination

  // Fetch memes
  Future<void> fetchMemes() async {
    if (isLoading.value) return; // Avoid making multiple requests at once
    isLoading.value = true;

    final url = 'https://meme-api.com/gimme/20'; // Paginated request
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        memes.addAll(data['memes']); // Add new memes to list

        page.value++; // Increment page number for next call
      } else {
        Get.snackbar('Error', 'Failed to load memes');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load memes: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Reset the meme list (if needed)
  void resetMemes() {
    memes.clear();
    page.value = 1;
  }
}