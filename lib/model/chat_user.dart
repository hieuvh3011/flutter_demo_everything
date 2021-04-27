class ChatUser {
  String id;
  String fullName;
  String email;
  String phone;
  List<ChatUser> contactList;

  ChatUser({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.contactList,
  });

  // ChatUser.fromJson(Map<String, dynamic> jsonObject)
  //     : id = jsonObject['id'],
  //       fullName = jsonObject['full_name'],
  //       email = jsonObject['email'],
  //       phone = jsonObject['phone'],
  //       contactList = jsonObject['contact_list'];

  static ChatUser fromJson(Map<String, dynamic> jsonObject) {
    ChatUser user = ChatUser();
    user.id = jsonObject['id'];
    user.fullName = jsonObject['full_name'];
    user.email = jsonObject['email'];
    user.phone = jsonObject['phone'];
    var rawContactList = jsonObject['contact'];
    user.contactList = [];
    rawContactList?.map((item){
      if (item != null){
        var itemUser = ChatUser.fromJson(item);
        user.contactList.add(itemUser);
      }
    });
    // contactList = jsonObject['contact_list'];
    return user;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'contact_list': contactList,
      };
}
