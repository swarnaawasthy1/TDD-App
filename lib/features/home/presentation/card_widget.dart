import 'package:flutter/material.dart';
import 'package:tddapp/features/home/domain/posts_model.dart';

class CardWidget extends StatelessWidget {
  final PostsModel? postData;

  const CardWidget({Key? key, this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF394867),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postData?.title ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            postData?.body ?? "",
            style: const TextStyle(
              color: Color(0xFF9BA4B5),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

