import 'package:flutter/material.dart';
import 'package:kp2024/controllers/pesanan_user/riwayat/riwayatUser.dart';
import 'package:kp2024/controllers/user_form/kelas_pengganti.dart';
import 'package:kp2024/models/appBarUniversal.dart';
import 'package:kp2024/pages/logSign.dart';
import 'package:kp2024/pages/user/reservasiPage/pesanan.dart';
import 'package:kp2024/pages/user/reservasiPage/reservasiContent.dart';
import 'package:kp2024/pages/user/reservasiPage/riwayatReservasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reservasi extends StatefulWidget {
  static const nameRoute = "/Reservasi";

  const Reservasi({Key? key}) : super(key: key);

  @override
  State<Reservasi> createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi>
    with SingleTickerProviderStateMixin {
  late String? _username = '';
  late String? token = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _getToken();

    _tabController =
        TabController(length: 2, vsync: this); // Initialize TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when not needed
    super.dispose();
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
      token = prefs.getString('token');
    });
  }

  void _logout() async {
    // Tampilkan dialog konfirmasi
    bool? logoutConfirmed = await _showLogoutConfirmationDialog(context);
    if (logoutConfirmed ?? false) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      // Navigator.pushReplacementNamed(context, LogSign.nameRoute);
      Navigator.pushReplacementNamed(context, Reservasi.nameRoute);
    }
  }

  Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Tidak
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Ya
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUniversal(
        token: token ?? "", // Pass the token
        username: _username ?? "", // Pass the username
        logoutCallback: () {
          _logout(); // Logout callback
        },
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController, // Connect TabBar to TabController
            tabs: const [
              Tab(text: 'Reservasi'),
              Tab(text: 'Pesanan'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController, // Connect TabBarView to TabController
              children: const [
                ReservasiContent(),
                Pesanan(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
