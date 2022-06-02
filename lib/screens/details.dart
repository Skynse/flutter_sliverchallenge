import 'package:flutter/material.dart';
import 'package:sliverchallenge/api/api.dart';

class DetailsScreen extends StatelessWidget {
  final Book book;

  DetailsScreen({Key? key, required this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              this.book.title!,
              style: TextStyle(
                fontSize: 20,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(10, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                this.book.thumbnail!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.book.description!,
                    style: const TextStyle(
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
