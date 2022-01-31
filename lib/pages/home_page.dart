import 'package:flutter/material.dart';
import 'package:instagram_ui/model/story_model.dart';
import 'package:instagram_ui/model/theme_model.dart';
import 'package:instagram_ui/model/user_model.dart';
import 'package:instagram_ui/model/user_story_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 4;

  List list = [
    User(userImage: "assets/images/im_user_2.png", userName: "User 1"),
    User(userImage: "assets/images/im_user_3.png", userName: "User 2"),
    User(userImage: "assets/images/im_user_4.png", userName: "User 3"),
    User(userImage: "assets/images/im_user_4.png", userName: "User 3"),
    User(userImage: "assets/images/im_user_4.png", userName: "User 3"),
    User(userImage: "assets/images/im_user_4.png", userName: "User 3"),
    User(userImage: "assets/images/im_user_5.png", userName: "User 4"),
    User(userImage: "assets/images/im_user_6.png", userName: "User 5"),
    User(userImage: "assets/images/im_user_6.png", userName: "User 5"),
    User(userImage: "assets/images/im_user_6.png", userName: "User 5"),
    User(userImage: "assets/images/im_user_6.png", userName: "User 5"),
    User(userImage: "assets/images/im_user_6.png", userName: "User 5"),
  ];

  List storyList = [
    UserStory(storyImage: "assets/images/im_user_2.png", storyName: "Friends"),
    UserStory(storyImage: "assets/images/im_user_3.png", storyName: "Sport"),
    UserStory(storyImage: "assets/images/im_user_4.png", storyName: "Design"),
    UserStory(storyImage: "assets/images/im_user_5.png", storyName: "Friends"),
    UserStory(storyImage: "assets/images/im_user_6.png", storyName: "Design"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    currentTheme.addListener(() => setState(() {}));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: const [
            SizedBox(
              width: 130,
            ),
            Icon(
              Icons.lock,
              size: 18,
            ),
            Text("Jacob_w "),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 340,

              /// * title
              title: title(),
              floating: true,
              pinned: true,
              // snap: true,
              bottom: TabBar(
                controller: controller,
                indicatorColor:
                    CustomTheme.isDarkTheme ? Colors.white : Colors.black,
                tabs: const [
                  Tab(icon: Icon(Icons.apps_outlined)),
                  Tab(icon: Icon(Icons.person_pin_outlined)),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: controller,
          children: [
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: list.map((e) => photosField(e)).toList(),
            ),
            GridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: list.map((e) => photosField(e)).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: index == 4
                        ? (CustomTheme.isDarkTheme
                            ? Colors.white
                            : Colors.black)
                        : Colors.transparent,
                  )),
              child: CircleAvatar(
                radius: 12,
                child: Image.asset("assets/images/im_user_3.png"),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }

  Column title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// * header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  )),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Image.asset(
                  "assets/images/im_user_3.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: const [
                Text("54"),
                Text(
                  "Posts",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              children: const [
                Text("834"),
                Text(
                  "Followers",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              children: const [
                Text("162"),
                Text(
                  "Following",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),

        /// * info
        const Text(
          "Jacob West",
          style: TextStyle(fontSize: 15),
        ),
        const Text(
          "Digital goodies designer @pixsellz",
          style: TextStyle(fontSize: 15),
        ),
        const Text(
          "Everything is designed.",
          style: TextStyle(fontSize: 15),
        ),

        /// * edit button
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                CustomTheme.isDarkTheme ? Colors.black : Colors.white,
            minimumSize: const Size(double.infinity, 20),
          ),
          onPressed: () {},
          child: Text(
            "Edit Profile",
            style: TextStyle(
                color: !CustomTheme.isDarkTheme ? Colors.black : Colors.white),
          ),
        ),

        /// * stores
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  currentTheme.toggleTheme();
                },
                child: Container(
                  height: 100,
                  width: 60,
                  margin: const EdgeInsets.only(
                      left: 7, right: 7, top: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      CustomTheme.isDarkTheme
                          ? const Text(
                              "Dark",
                              style: TextStyle(fontSize: 13),
                            )
                          : const Text(
                              "Light",
                              style: TextStyle(fontSize: 13),
                            ),
                    ],
                  ),
                ),
              ),
              ...storyList.map((e) => StoryModel(userStory: e)).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget photosField(User e) {
    return Stack(
      children: [
        Image.asset("assets/images/img_user.jpg"),
        e.userImage.contains("4.png")
            ? Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(5),
                child: const Icon(
                  Icons.video_call_rounded,
                  color: Colors.white,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
