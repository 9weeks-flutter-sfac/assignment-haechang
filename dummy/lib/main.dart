import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  final dio = Dio();

  Future<Map<String, dynamic>> getData() async {
    try {
      var response =
          await dio.get('https://sniperfactory.com/sfac/http_day16_dogs');
      return response.data;
    } catch (e) {
      throw (e);
    }
  }

  bool isLoading = true;

  Future<Widget> checkConnectivityWifi() async {
    try {
      isLoading = false;
      setState(() {});
      await Future.delayed(Duration(seconds: 2));
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        isLoading = true;
        setState(() {});
      } else if (connectivityResult == ConnectivityResult.wifi) {
        isLoading = true;
        setState(() {});
      } else {
        isLoading = true;
        setState(() {});
      }
    } catch (e) {
      print(e);
    }

    return CircularProgressIndicator();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<void> _onRefresh() async {
    await getData();
    setState(() {});
    _refreshController.refreshCompleted();
  }

  var items;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            appBar: AppBar(
              title: Text('8일차 과제'),
            ),
            body: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  {
                    items = snapshot.data;
                    return SmartRefresher(
                      controller: _refreshController,
                      enablePullDown: true,
                      header: WaterDropHeader(),
                      onRefresh: _onRefresh,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: items!["body"].length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 250,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Image.network(
                                            items["body"][index]["url"],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(items["body"][index]["msg"]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.comment),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('errer'),
                  );
                } else
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 1000),
                    child: Shimmer.fromColors(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: 8,
                            itemBuilder: (context, index) => Card()),
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade100),
                  );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => checkConnectivityWifi(),
              child: Icon(Icons.wifi_find),
            ),
          )
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('인터넷 확인 중 입니다'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
  }
}
