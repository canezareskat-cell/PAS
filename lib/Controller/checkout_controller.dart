import 'package:get/get.dart';
import '../Models/makanan_model.dart';

class CheckoutController extends GetxController {

  var listMakanan = <MakananModel>[
    MakananModel(nama: "Burger Spesial", harga: 100000),
    MakananModel(nama: "Pizza Jumbo", harga: 150000),
    MakananModel(nama: "Kentang Goreng", harga: 30000),
    MakananModel(nama: "Ayam Bakar", harga: 45000),
    MakananModel(nama: "Es Teh Manis", harga: 10000),
    MakananModel(nama: "Es Jeruk", harga: 15000),
    MakananModel(nama: "Sate Ayam", harga: 20000),
    MakananModel(nama: "Nasi Goreng", harga: 25000),
    MakananModel(nama: "Mie Nyemek", harga: 18000),
    MakananModel(nama: "Es Kopi Susu", harga: 12000),
    MakananModel(nama: "Kerupuk", harga: 5000),
    MakananModel(nama: "Pudding", harga: 8000)
  ].obs;


  var nilaiDiskon = 0.0.obs;
  var nilaiPajak = 0.0.obs;


  final List<double> opsiDiskon = [0, 5, 10, 15, 20, 50];
  final List<double> opsiPajak = [0, 5, 10, 11, 15];

  
  void togglePilihMakanan(int index) {
    listMakanan[index].isSelected = !listMakanan[index].isSelected;
    listMakanan.refresh(); 
  }

 
  double get subTotal {
    double total = 0;
    for (var makanan in listMakanan) {
      if (makanan.isSelected) {
        total += makanan.harga;
      }
    }
    return total;
  }
  
  double get nominalDiskon => subTotal * (nilaiDiskon.value / 100);
  double get nominalPajak => (subTotal - nominalDiskon) * (nilaiPajak.value / 100);
  double get grandTotal => subTotal - nominalDiskon + nominalPajak;

  
  void setDiskon(double diskonBaru) => nilaiDiskon.value = diskonBaru;
  void setPajak(double pajakBaru) => nilaiPajak.value = pajakBaru;
}
