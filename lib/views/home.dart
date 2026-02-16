import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:biodata_flutter/models/msiswa.dart';
import 'package:biodata_flutter/models/api.dart';
import 'package:http/http.dart' as http;
import 'package:biodata_flutter/views/create.dart';
import 'package:biodata_flutter/views/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<SiswaModel>> sw;
  final swListKey = GlobalKey<HomeState>();
  @override
  void initState() {
    super.initState();
    sw = getSwList();
  }

  Future<List<SiswaModel>> getSwList() async {
    final response = await http.get(Uri.parse(BaseUrl.data));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<SiswaModel> sw = items.map<SiswaModel>((json) {
      return SiswaModel.fromJson(json);
    }).toList();
    return sw;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Data Siswa'), centerTitle: true),
      body: Center(
        child: FutureBuilder<List<SiswaModel>>(
          future: sw,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (!snapshot.hasData) return CircularProgressIndicator();
            {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.view_list),
                      title: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        data.nis + " - " + data.nama,
                        style: TextStyle(fontSize: 20),
                      ),
                      // ignore: prefer_interpolation_to_compose_strings
                      subtitle: Text(data.tplahir + ", " + data.tglahir),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Details(sw: data),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: sort_child_properties_last
        child: Icon(Icons.add),
        hoverColor: Colors.green,
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => Create()),
          );
        },
      ),
    );
  }
}
