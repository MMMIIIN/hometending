import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometending/src/home/controller/community_controller.dart';

final CommunityController _communityController = Get.put(CommunityController());

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Obx(
            () => dropDownTap(),
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
}
