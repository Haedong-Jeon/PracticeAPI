import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = './detail_page';
  Widget _buildTextList() {
    return Container(
      width: double.infinity,
      height: 100,
      child: Text(
        '!!',
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> args = ModalRoute.of(context).settings.arguments;
    String title = args['title'];
    String imageUrl = args['imageUrl'];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
              background: Hero(
                tag: title,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                for (int i = 0; i < 1000; i++) _buildTextList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
