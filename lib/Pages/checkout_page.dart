
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/checkout_controller.dart';

class CheckoutPage extends StatelessWidget {
  final CheckoutController controller = Get.put(CheckoutController());

  CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu Checkout")),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.listMakanan.length,
              itemBuilder: (context, index) {
                var makanan = controller.listMakanan[index];
                return CheckboxListTile(
                  title: Text(makanan.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Rp ${makanan.harga}"),
                  value: makanan.isSelected,
                  onChanged: (bool? value) {
                    controller.togglePilihMakanan(index);
                  },
                  secondary: const Icon(Icons.fastfood, color: Colors.orange),
                );
              },
            )),
          ),

       
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
            ),
            child: Column(
              children: [
                const Text("Pengaturan Diskon & Pajak", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

          
                
                buildCampuran(), 
                
                

                const SizedBox(height: 15),
                

                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  onPressed: () {
                    if (controller.subTotal == 0) {
                      Get.snackbar("Oops!", "Pilih minimal 1 makanan dulu ya", snackPosition: SnackPosition.BOTTOM);
                      return;
                    }
                    Get.toNamed("/nota"); 
                  },
                  child: const Text("CHECKOUT SEKARANG"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildInputManual() {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Masukkan Diskon (%)', border: OutlineInputBorder()),
          onChanged: (value) => controller.setDiskon(double.tryParse(value) ?? 0.0),
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Masukkan Pajak (%)', border: OutlineInputBorder()),
          onChanged: (value) => controller.setPajak(double.tryParse(value) ?? 0.0),
        ),
      ],
    );
  }


  Widget buildDropdownSemua() {
    return Column(
      children: [
        Obx(() => DropdownButtonFormField<double>(
          decoration: const InputDecoration(labelText: 'Pilih Diskon (%)', border: OutlineInputBorder()),
          value: controller.nilaiDiskon.value,
          items: controller.opsiDiskon.map((e) => DropdownMenuItem(value: e, child: Text("$e %"))).toList(),
          onChanged: (value) => controller.setDiskon(value ?? 0.0),
        )),
        const SizedBox(height: 15),
        Obx(() => DropdownButtonFormField<double>(
          decoration: const InputDecoration(labelText: 'Pilih Pajak (%)', border: OutlineInputBorder()),
          value: controller.nilaiPajak.value,
          items: controller.opsiPajak.map((e) => DropdownMenuItem(value: e, child: Text("$e %"))).toList(),
          onChanged: (value) => controller.setPajak(value ?? 0.0),
        )),
      ],
    );
  }


  Widget buildCampuran() {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Masukkan Diskon (%)', border: OutlineInputBorder()),
          onChanged: (value) => controller.setDiskon(double.tryParse(value) ?? 0.0),
        ),
        const SizedBox(height: 15),
        Obx(() => DropdownButtonFormField<double>(
          decoration: const InputDecoration(labelText: 'Pilih Pajak (%)', border: OutlineInputBorder()),
          value: controller.nilaiPajak.value,
          items: controller.opsiPajak.map((e) => DropdownMenuItem(value: e, child: Text("$e %"))).toList(),
          onChanged: (value) => controller.setPajak(value ?? 0.0),
        )),
      ],
    );
  }

 
  Widget buildCampuranSebaliknya() {
    return Column(
      children: [
        Obx(() => DropdownButtonFormField<double>(
          decoration: const InputDecoration(labelText: 'Pilih Diskon (%)', border: OutlineInputBorder()),
          value: controller.nilaiDiskon.value,
          items: controller.opsiDiskon.map((e) => DropdownMenuItem(value: e, child: Text("$e %"))).toList(),
          onChanged: (value) => controller.setDiskon(value ?? 0.0),
        )),
        const SizedBox(height: 15),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Masukkan Pajak (%)', border: OutlineInputBorder()),
          onChanged: (value) => controller.setPajak(double.tryParse(value) ?? 0.0),
        ),
      ],
    );
  }
}