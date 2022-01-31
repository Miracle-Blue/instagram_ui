class User {
  String userImage;
  String userName;
  bool isActive;
  bool story;

  User({required this.userImage, required this.userName, this.isActive = false, this.story = false});
}
