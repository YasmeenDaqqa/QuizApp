class ApiPaths {
  static String products() => 'products/';
  static String product(String id) => 'products/$id';
  static String catrgories() => 'catrgories/';
  static String catrgorie(String id) => 'catrgories/$id';
  static String announcements() => 'announcements/';
  static String announcement(String id) => 'announcements/$id';
    static String userrs() => 'users/';
  static String userr(String id) => 'users/$id';
   static String user(String uid) => 'users/$uid';
   static String cartItem(String uid, String cartItemId) =>
      'users/$uid/cartItems/$cartItemId';
  static String cartItems(String uid) => 'users/$uid/cartItems/';
  static String addresses(String uid) => 'users/$uid/addresses/';
  static String paymentMethods(String uid) => 'users/$uid/paymentMethods/';
   static String fav(String uid, String favId) =>
    'users/$uid/favs/$favId';
    static String favs(String uid) => 'users/$uid/favs/';
}