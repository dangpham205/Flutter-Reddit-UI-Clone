class Reddit{
  final String id;
  final String name;
  final String avatarUrl;
  final String bio;
  final List members;

  const Reddit({
      required this.id,
      required this.name,
      required this.avatarUrl,
      required this.bio,
      required this.members,
  });

  // Map<String, dynamic> toJSON() => {
  //   "uid": uid,
  //   "email": email,
  //   "username": username,
  //   "bio": bio,
  //   "followers": followers,
  //   "following": following,
  //   "photoUrl": photoUrl,
  // };

  // //static method là method có thể gọi thẳng từ lớp mà kh cần tạo obj
  // // User.fromSnapShot()
  // static User fromSnapShot(DocumentSnapshot snapshot) {

    
  //   var snap = snapshot.data()! as Map<String, dynamic>;   //cast snapshot thành dạng Map

  //   return User(    //chuyển thành object User và return
  //     uid: snap['uid'],
  //     email: snap['email'],
  //     username: snap['username'],
  //     bio: snap['bio'],
  //     followers: snap['followers'],
  //     following: snap['following'],
  //     photoUrl: snap['photoUrl']
  //   );
  // }
    
}