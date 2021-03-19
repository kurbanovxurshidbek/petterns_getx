import 'package:get/get.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/service/http_service.dart';


class HomeController extends GetxController {
  var isLoading = false.obs;

  var items = new List<Post>().obs;

  Future apiPostList() async {
    isLoading(true);
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null){
      items.value = Network.parsePostList(response);
    }else{
      items.value = new List();
    }
    isLoading(false);
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading(true);
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading(false);
    return response != null;
  }
}
