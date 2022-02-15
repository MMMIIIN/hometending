import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometending/src/home/controller/community_controller.dart';

final CommunityController _communityController = Get.put(CommunityController());

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Obx(
                () => dropDownTap(),
          ),
          Obx(
                () => Expanded(
              child:
              _communityController.communityDropDownValue.value == '자유게시판'
                  ? freeBoardContent()
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownTap() {
    return DropdownButton(
      value: _communityController.communityDropDownValue.value,
      items: CommunityTap.values.map((items) {
        return DropdownMenuItem(
            value: items.convertCommunityTap,
            child: Text(items.convertCommunityTap));
      }).toList(),
      onChanged: (String? newValue) {
        _communityController.communityDropDownValue(newValue);
      },
    );
  }

  Widget freeBoardContent() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all()
            ),
          ),
        );
      },
    );
  }
}
