import 'package:flutter/material.dart';
import 'package:kp2024/models/detailLabModel/_containerDetailLab.dart';
import 'package:kp2024/models/detailLabModel/_hardware.dart';
import 'package:kp2024/models/detailLabModel/_software.dart';
import 'package:kp2024/models/detailLabModel/_spesifikasiLab.dart';
import 'package:kp2024/pages/dashboard/footer.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasi.dart';

class DetailB extends StatefulWidget {
  const DetailB({super.key});

  @override
  State<DetailB> createState() => _DetailBState();
}

class _DetailBState extends State<DetailB> {
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width > 1200;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerDetailLab(
              laboratorium: "LABORATORIUM \nMULTIMEDIA",
              namaLab: "B",
              imageAsset: "images/gambar.jpg",
              onpressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Reservasi(namaLab: "B"),
                  ),
                );
              },
            ),
            const SpesifikasiDetailLab(
              namaLab: "B",
              jumlahPc: "40",
            ),
            isScreenWide
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hardware(
                        processor: "Intel I7 7700F ",
                        ram: "16",
                        vga: "RTX 4090",
                        mouse: "Logitech K40",
                        monitor: "LG K789H",
                        keyboard: "Logitech K490",
                      ),
                      Software(
                        software_1: "Flutter",
                        software_2: "Adobe Premiere",
                        software_3: "Node Js",
                      ),
                    ],
                  )
                : const Column(
                    children: [
                      Hardware(
                        processor: "Intel I7 7700F ",
                        ram: "16",
                        vga: "RTX 4090",
                        mouse: "Logitech K40",
                        monitor: "LG K789H",
                        keyboard: "Logitech K490",
                      ),
                      Software(
                        software_1: "Flutter",
                        software_2: "Adobe Premiere",
                        software_3: "Node Js",
                      ),
                    ],
                  ),
            const SizedBox(
              height: 30,
            ),
            Footer().buildContainer()
          ],
        ),
      ),
    );
  }
}
