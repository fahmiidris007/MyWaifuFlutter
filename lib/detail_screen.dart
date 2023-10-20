import 'package:flutter/material.dart';
import 'package:my_waifu_flutter/model/waifus_data.dart';

class DetailScreen extends StatelessWidget {
  final WaifusData waifu;

  const DetailScreen({Key? key, required this.waifu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(waifu: waifu);
        } else {
          return DetailMobilePage(waifu: waifu);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final WaifusData waifu;

  const DetailMobilePage({Key? key, required this.waifu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: ClipOval(
                          child: Image.asset(
                        waifu.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: FavoriteButton(),
                        ),
                      ],
                    ),

                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                waifu.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 30.0, fontFamily: 'Poppins', color: Colors.green),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                waifu.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'ComicNeue',
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 5)),
              padding: const EdgeInsets.all(8.0),
              child: DataTable(columns: const [
                DataColumn(label: Text("")),
                DataColumn(label: Text(""))
              ], rows: [
                DataRow(cells: [
                  const DataCell(Text("Name")),
                  DataCell(Text(waifu.name)),
                ]),
                DataRow(cells: [
                  const DataCell(Text("Anime")),
                  DataCell(Text(waifu.anime)),
                ]),
                DataRow(cells: [
                  const DataCell(Text("Genre")),
                  DataCell(Text(waifu.genre)),
                ]),
                DataRow(cells: [
                  const DataCell(Text("Character")),
                  DataCell(Text(waifu.character)),
                ]),
                DataRow(cells: [
                  const DataCell(Text("Seiyuu")),
                  DataCell(Text(waifu.seiyuu)),
                ]),
                DataRow(cells: [
                  const DataCell(Text("Couple")),
                  DataCell(Text(waifu.couple)),
                ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final WaifusData waifu;

  const DetailWebPage({Key? key, required this.waifu}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'My Waifu App',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontSize: 32, color: Colors.green),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(widget.waifu.image),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "Description :",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.waifu.description,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green, width: 5)),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Stack(children: <Widget>[
                                  Center(
                                    child: Text(
                                      widget.waifu.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 30.0,
                                          fontFamily: 'Poppins',
                                          color: Colors.green),
                                    ),
                                  ),
                                  Container(
                                      alignment:Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: const FavoriteButton()),
                                ]),
                                DataTable(columns: const [
                                  DataColumn(label: Text("")),
                                  DataColumn(label: Text(""))
                                ], rows: [
                                  DataRow(cells: [
                                    const DataCell(Text("Name")),
                                    DataCell(Text(": ${widget.waifu.name}")),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Anime")),
                                    DataCell(Text(": ${widget.waifu.anime}")),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Genre")),
                                    DataCell(Text(": ${widget.waifu.genre}")),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Character")),
                                    DataCell(
                                        Text(": ${widget.waifu.character}")),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Seiyuu")),
                                    DataCell(Text(": ${widget.waifu.seiyuu}")),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text("Couple")),
                                    DataCell(Text(": ${widget.waifu.couple}")),
                                  ]),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
        size: 40,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
          if (isFavorite) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Favorited'),
                  content: const Text('Waifu has been favorited.'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Unfavorited'),
                  content: const Text('Your Waifu has gone :('),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        });
      },
    );
  }
}
