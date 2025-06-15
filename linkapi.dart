class Apidata {
  static const String server = "http://192.168.1.6/ecommerce";
  static const String test = "$server/test.php";
  //=======================signup=======================//
  static const String singup = "$server/auth/signup.php";
  static const String verify = "$server/auth/verify.php";
  static const String login = "$server/auth/login.php";
  //=======================forgetpassword======================//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycode = "$server/forgetpassword/verifycode.php";
  static const String homepage = "$server/home.php";
  //=======================image======================//
  static const String imageitem = "$server/upload/items";
  static const String imagecatagries = "$server/upload/catagries";
  //========================home======================//
  static const String items = "$server/item/items.php";
  //=======================favourite==================//
  static const String favourite = "$server/item/favourit.php";
  static const String deletfavourite = "$server/item/deletfavourite.php";
  static const String favouritepage = "$server/item/favouritepage.php";
  static const String deletfavcard = "$server/item/deletfavcard.php";
  //==============================cart=====================//
  static const String insertcart = "$server/cart/insertcard.php";
  static const String selectcart = "$server/cart/selectcart.php";
  static const String deletctcart = "$server/cart/deletcart.php";
  static const String increasecart = "$server/cart/incresscart.php";
  static const String decreasecart = "$server/cart/decressitem.php";
  static const String cartcount = "$server/cart/cartcount.php";
  static const String removecart = "$server/cart/removecart.php";
  static const String deleteallcart = "$server/cart/deletallcart.php";
  //========================search======================//
  static const String search = "$server/search/search.php";
  //========================adress======================//
  static const String addadress = "$server/adress/addadress.php";
  static const String viewadress = "$server/adress/viewadress.php";
  static const String deletadress = "$server/adress/deleteadress.php";
  static const String updateadress = "$server/adress/updataadress.php";
  //========================coupon======================//
  static const String coupon = "$server/coupon/coupon.php";
  //=========================checkout=====================//
  static const String checkout = "$server/order/checkorder.php";
  static const String orderdetails = "$server/order/orderdetails.php";
  static const String deleteorder = "$server/order/deleteorder.php";
  static const String orderarchive = "$server/order/orderarchive.php";
  static const String offer = "$server/offer/offer.php";
   static const String updaterate = "$server/order/updaterate.php";
  
}
