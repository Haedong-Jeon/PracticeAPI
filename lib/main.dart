import 'package:PracticeAPI/detail_page.dart';
import 'package:PracticeAPI/personalData.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import './custom_transition.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: GraphQLProvider(
        client: graphqlService.client,
        child: APITest(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          },
        ),
      ),
      routes: {
        DetailPage.routeName: (context) => DetailPage(),
      },
    );
  }
}

class APITest extends StatefulWidget {
  @override
  _APITestState createState() => _APITestState();
}

class _APITestState extends State<APITest> {
  StreamBuilder<QueryResult> _stream;
  StreamBuilder<QueryResult> get stream {
    return _stream;
  }

  String query = """
  query users(\$page: Int, \$limit: Int){
    users(page: \$page, limit: \$limit){
      data {
        id
        title
        firstName
        lastName
        email
        picture
      }
      total
      page
      limit
      offset
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('GraphQL TEST'),
        ),
      ),
      body: Query(
        options: QueryOptions(
          documentNode: gql(query),
          variables: {
            'page': 1,
            'limit': 10000,
          },
          pollInterval: 3,
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }
          if (result.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List list = result.data['users']['data'];
          return Container(
            height: double.infinity,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => PersonalData(
                firstName:
                    result.data['users']['data'][index]['firstName'].toString(),
                lastName:
                    result.data['users']['data'][index]['lastName'].toString(),
                email: result.data['users']['data'][index]['email'].toString(),
                imgURL: result.data['users']['data'][index]['picture'],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GraphqlService {
  static final HttpLink httpLink = HttpLink(
    uri: 'https://dummyapi.io/data/graphql',
    headers: {'app-id': '600d7e386f7ee64240b1b707'},
  );
  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );
}

final graphqlService = GraphqlService();
