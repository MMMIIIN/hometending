import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hometending/src/home/controller/home_controller.dart';
import 'package:hometending/src/home/page/add_page/freeboard_add_page.dart';
import 'package:hometending/src/home/page/community_page.dart';
import 'package:hometending/src/home/page/home_page.dart';
import 'package:hometending/src/home/page/information_page.dart';
import 'package:hometending/src/home/page/settings_page.dart';

final HomeController _homeController = Get.put(HomeController());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          switch (_homeController.pageIndex.value) {
            case 0:
              return HomePage();
            case 1:
              return CommunityPage();
            case 2:
              return InformationPage();
            case 3:
              return SettingsPage();
          }
          return Container();
        }),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            _homeController.pageIndex(index);
          },
          currentIndex: _homeController.pageIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: '홈'),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              activeIcon: Icon(Icons.dashboard),
              label: '커뮤니티',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),
                activeIcon: Icon(Icons.menu_book),
                label: '정보'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: '설정'),
          ],
        ),
      ),
      floatingActionButton: Obx(() => _homeController.pageIndex.value == 1
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Get.to(() => FreeBoardAddPage());
              },
              backgroundColor: Colors.orangeAccent,
            )
          : Container()),
    );
  }
}
