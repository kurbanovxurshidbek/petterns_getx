import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/views/item_of_post.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GetX"),
        ),
        body: Obx(
          () => Stack(
            children: [
              ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(_controller.items[index],_controller);
                },
              ),
              _controller.isLoading()
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Get.to(DetailPage());
          },
          child: Icon(Icons.add),
        ));
  }
}
