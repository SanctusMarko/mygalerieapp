import 'package:flutter/material.dart';

class GaleryScreenItem extends StatelessWidget {
  const GaleryScreenItem({
    super.key,
    required this.title,
    required this.url,
    required this.data,
    required this.description,
  });
  final String title;
  final String url;
  final String data;
  final String description;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: {
            'title': title,
            'url': url,
            'date': data,
            'description': description,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  url,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
