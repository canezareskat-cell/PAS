import 'package:get/get.dart';
import 'Pages/checkout_page.dart';
import 'Pages/nota_page.dart'; 

  class Routes {
  static const String list_motor = "/list_motor";
  static const String details_motor = "/details_motor";
  static const String checkout = "/checkout"; 
  static const String nota = "/nota";


  static final myPages = [
   
    GetPage(
      name: checkout,
      page: () => CheckoutPage(),
    ),
    GetPage(
      name: nota,
      page: () => NotaPage(), 
    ),
  ];
}