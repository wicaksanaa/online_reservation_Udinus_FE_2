import 'package:flutter/material.dart';
import 'package:kp2024/models/_heading1.dart';
import 'package:kp2024/models/admin/_buttonDelete.dart';
import 'package:kp2024/models/admin/_buttonEdit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JadwalHari extends StatefulWidget {
  static const nameRoute = "/JadwalHari";

  const JadwalHari({Key? key}) : super(key: key);

  @override
  State<JadwalHari> createState() => _JadwalHariState();
}

class _JadwalHariState extends State<JadwalHari> {
  String? namaLabAdmin;
  String? hariAdmin;
  List<String> WaktuMulai = [
    "07.00",
    "07.40",
    "08.40",
    "10.20",
    "11.10",
    "12.30",
    "13.20",
    "14.10",
    "15.30",
    "16.20",
    "17.10",
    "18.30",
    "19.20",
    "20.10",
  ];

  List<String> WaktuSelesai = [
    "07.40",
    "08.40",
    "09.30",
    "11.10",
    "12.00",
    "13.20",
    "14.10",
    "15.00",
    "16.20",
    "17.10",
    "18.00",
    "19.20",
    "20.10",
    "21.00",
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? namaLabAdmin = prefs.getString('namaLabAdmin');
    String? hariAdmin = prefs.getString('hariAdmin');

    setState(() {
      this.namaLabAdmin = namaLabAdmin;
      this.hariAdmin = hariAdmin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Heading1(
            text: "Jadwal Laboratorium $namaLabAdmin $hariAdmin",
            color: Colors.black),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.green[50],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.green[50],
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    "Laboratorium",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    "Jam Mulai",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    "Jam Selesai",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    "Nama Matkul",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    "Kode Kelas",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    "Dosen Pengampu",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    "Opsi",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: _generateDummyData(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> _generateDummyData() {
    List<DataRow> dummyData = [];

    for (int i = 0; i < WaktuMulai.length; i++) {
      dummyData.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(
                'Laboratorium $namaLabAdmin $hariAdmin',
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                WaktuMulai[i],
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                WaktuSelesai[i],
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                'Nama Matkul $i',
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                'Kode Kelas $i',
                style: TextStyle(fontSize: 10),
              ),
            ),
            DataCell(
              Text(
                'Dosen Pengampu $i',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonEdit(),
                  SizedBox(
                    width: 5,
                  ),
                  ButtonDelete(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return dummyData;
  }
}