import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/model/post_model.dart';

Widget itemOfPost(Post post, HomeController controller) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {

        },
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          controller.apiPostDelete(post).then((value) => {
            if(value){
              controller.apiPostList(),
            }
          });
        },
      ),
    ],
  );
}
