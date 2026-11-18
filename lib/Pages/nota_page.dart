// lib/Pages/nota_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/checkout_controller.dart';

class NotaPage extends StatelessWidget {

  final CheckoutController controller = Get.find<CheckoutController>();

  NotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Struk Pembayaran"),

        automaticallyImplyLeading: false, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text("Ringkasan Pesanan", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            
            // Tampilan Harga
            Text("Subtotal : Rp ${controller.subTotal}", style: const TextStyle(fontSize: 16)),
            Text("Diskon (${controller.nilaiDiskon.value}%) : - Rp ${controller.nominalDiskon}", style: const TextStyle(fontSize: 16)),
            Text("Pajak (${controller.nilaiPajak.value}%) : + Rp ${controller.nominalPajak}", style: const TextStyle(fontSize: 16)),
            
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            
            Text(
              "TOTAL BAYAR: Rp ${controller.grandTotal}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            
            const Spacer(),
            
          
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
       
                Get.offAllNamed("/checkout"); 
              },
              child: const Text("KEMBALI KE MENU UTAMA", style: TextStyle(color: Colors.white)),
            )
          ],
        )),
      ),
    );
  }
}