
class MakananModel {
  String nama;
  double harga;
  bool isSelected; 

  MakananModel({
    required this.nama,
    required this.harga,
    this.isSelected = false, 
  });
}
