import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import '../model/callAPI.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  @override
  void initState() {
    super.initState();
    data = callAPI();
    print(data);
  }

  Future<Api> callAPI() async {
    final response = await http.get(
        Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'));
    if (response.statusCode == 200) {
      return Api.fromJson(jsonDecode(response.body)[0]);
    } else {
      throw Exception("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.api),
          Text('Dashboard'),
        ]),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: callAPI(),
          builder: (context, snapshot) {
            return Column(
              
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'อัพเดทล่าสุด : ${snapshot.data?.updateDate.day ?? ""}/${snapshot.data?.updateDate.month ?? ""}/${snapshot.data?.updateDate.year ?? ""}',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'ผู้ป่วยสะสม : ${snapshot.data?.totalCase ?? ""} คน',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'ผู้ป่วยรายใหม่ : ${snapshot.data?.newCase ?? ""} คน',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'ผู้ป่วยตายสะสม : ${snapshot.data?.totalDeath ?? ""} คน',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'ผู้ป่วยตายรายใหม่ : ${snapshot.data?.newDeath ?? ""} คน',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
