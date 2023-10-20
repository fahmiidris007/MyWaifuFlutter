import 'package:flutter/material.dart';
import 'package:my_waifu_flutter/detail_screen.dart';
import 'package:my_waifu_flutter/model/waifus_data.dart';


class ListScreen extends StatelessWidget {
  final String name;
  const ListScreen(this.name,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hai $name, Your Waifu is Here", style: const TextStyle(fontSize: 18, fontFamily: "Poppins"),),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        if (constraints.maxWidth <= 600) {
          return const WaifusList();
        } else if (constraints.maxWidth <= 1200) {
          return const WaifusGrid(gridCount: 4);
        } else {
          return const WaifusGrid(gridCount: 6);
        }
      }),
    );
  }
}

class WaifusList extends StatelessWidget {
  const WaifusList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final WaifusData waifu = waifusDataList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(waifu: waifu,);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(waifu.image),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          waifu.name,
                          style: const TextStyle(fontSize: 16.0, fontFamily: "Poppins"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(waifu.anime),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: waifusDataList.length,
    );

  }
}


class WaifusGrid extends StatelessWidget {
  final int gridCount;

  const WaifusGrid({Key? key, required this.gridCount}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: waifusDataList.map((waifu) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(waifu: waifu,);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      waifu.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      waifu.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      waifu.anime,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

