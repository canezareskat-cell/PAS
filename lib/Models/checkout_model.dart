
class CheckoutModel {
  double subTotal;
  double nilaiDiskon;
  double nilaiPajak;

  CheckoutModel({
    this.subTotal = 150000.0, 
    this.nilaiDiskon = 0.0,
    this.nilaiPajak = 0.0,
  });


  double get nominalDiskon => subTotal * (nilaiDiskon / 100);
  double get nominalPajak => (subTotal - nominalDiskon) * (nilaiPajak / 100);
  double get grandTotal => subTotal - nominalDiskon + nominalPajak;
}
