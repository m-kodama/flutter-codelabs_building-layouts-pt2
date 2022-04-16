import 'package:flutter/material.dart';
import 'package:flutter_codelab_2/ui/bottom_bar/widget/bottom_bar_widget.dart';
import 'package:flutter_codelab_2/ui/core/color.dart';
import 'package:flutter_codelab_2/ui/landing/view_model/mock.dart';
import 'package:flutter_codelab_2/ui/landing/view_model/state/attraction_state.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryGray,
        iconTheme: const IconThemeData(color: mainYellow),
        title: const Icon(Icons.airplanemode_on),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_on_outlined,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: mainYellow,
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(20),
          child: const Icon(
            Icons.airplanemode_on,
            size: 80,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            primaryGray,
            secondaryGray,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Header(),
            _AttractionListView(),
            BottomBarWidget(),
          ],
        ),
      ),
    );
  }
}

/// ヘッダー
class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'あなたは',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'どこへ行きたい？',
                  style: TextStyle(
                    color: mainYellow,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  '検索',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

/// リストビュー
class _AttractionListView extends StatelessWidget {
  const _AttractionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: const EdgeInsets.only(left: 10),
      itemCount: attractions.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final attraction = attractions[index];
        return _AttractionCard(attraction: attraction);
      },
    ));
  }
}

/// アトラクションカード
class _AttractionCard extends StatelessWidget {
  const _AttractionCard({
    required this.attraction,
    Key? key,
  }) : super(key: key);

  final AttractionState attraction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            // 背景画像
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(attraction.imgPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // グラデーション
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // タイトル等
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    attraction.name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    attraction.location!,
                    style: const TextStyle(
                      color: mainYellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
