import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/hero.dart';
import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: "Tas Ransel", 
      price: "Rp 300.000", 
      gambar: '../assets/image/ransel.jpg', 
      stok: "12", 
      deskripsi: 'Tas ransel praktis dan stylish, cocok untuk aktivitas sehari-hari atau perjalanan.', rating: '5'
    ),
    Item(
      name: "Sepatu", 
      price: "Rp 550.000", 
      gambar: '../assets/image/sepatu.jpg', 
      stok: "5", 
      deskripsi: 'Sepatu trendy dan nyaman, cocok untuk berbagai aktivitas.', rating: '5'
    ),
    // Tambahkan item lain sesuai kebutuhan
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Belanja"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            HeroSection(),
            Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(child: Text(item.name)),
                      Expanded(
                        child: Text(
                          'Rp ${item.price.toString()}',
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),

            ),
            FooterSection()
          ],

        ),
      ),
    );
  }
}
