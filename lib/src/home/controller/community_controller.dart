import 'package:get/get.dart';

enum CommunityTap { freeBoard, recipe }

extension CommunityTapExtension on CommunityTap {
  String get convertCommunityTap {
    switch(this){
      case CommunityTap.freeBoard:
        return '자유게시판';
      case CommunityTap.recipe:
        return '레시피 공유';
      default:
        return '';
    }
  }
}

class CommunityController extends GetxController {
  RxString communityDropDownValue = CommunityTap.freeBoard.convertCommunityTap.obs;
}
