import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:x_youtube/function/featchdata.dart';

import 'package:x_youtube/remote_data/modle/modle.dart';
import 'package:x_youtube/screen/videodetails.dart';

import 'package:x_youtube/screen/widgets/customappbar.dart';
import 'package:http/http.dart ' as http;
import 'package:x_youtube/screen/widgets/videoitem.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  bool istyping = false;
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fetchData('flutter');
    super.initState();
  }

  static List<Modle> list = [];
  Future<void> fetchData(String text) async {
    String path =
        '/v2/search/videos?keyword=$text&uploadDate=all&duration=all&sortBy=relevance';
    final url = Uri.parse('${Helper.basul}$path');
    final response = await http.get(url, headers: Helper.header);

    print('Response: ${response.body}');
    final data = jsonDecode(response.body);
    list.clear();
    setState(() {
      for (var item in data['items']) {
        list.add(Modle.fromJson(item));
      }
    });
    if (list.isNotEmpty) {
      print('First video title: ${list[0].title}');
    }
  }

  change_typing() => setState(() {
    istyping = true;
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: -10,
          toolbarHeight: 90,
          title: Customappbar(
            istyping: istyping,
            ontap: change_typing,
            controller: controller,
            focusNode: focusNode,
            onsubmitted: (p0) {
              setState(() {
                fetchData(p0);
                controller.clear();
              });
            },
          ),
        ),
        body: list.isEmpty
            ? Center(child: CircularProgressIndicator(color: Colors.white))
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Videodetails(id: list[index].id!),
                        ),
                      );
                    },
                    child: Videoitem(modl: list[index]),
                  );
                },
              ),
      ),
    );
  }
}
