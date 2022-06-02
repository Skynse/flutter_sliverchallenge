import 'package:flutter/material.dart';
import 'package:sliverchallenge/models/book_model.dart';
import 'package:sliverchallenge/api/api.dart';
import 'package:provider/provider.dart';
import 'package:sliverchallenge/screens/details.dart';

String shortSummary(String s) {
  if (s.length > 100) {
    return s.substring(0, 100) + '...';
  }
  return s;
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<BookModel>(context, listen: false).loadBooks();
    return Scaffold(
        appBar: AppBar(
          title: Text('Books'),
        ),
        // load books in 3 column grid scrollview
        body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            book: Provider.of<BookModel>(context, listen: false)
                                .books[index]),
                      ),
                    ),
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              Provider.of<BookModel>(context, listen: false)
                                  .books[index]
                                  .smallThumbnail!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                Provider.of<BookModel>(context, listen: false)
                                    .books[index]
                                    .title!,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount:
                    Provider.of<BookModel>(context, listen: false).books.length,
              ),
            ),
          ],
        ));
  }
}
