import 'package:flutter/material.dart';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;
import 'package:digi_text/utility/CustomColour.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DownloadAssetsDemo extends StatefulWidget {
  const DownloadAssetsDemo({super.key});

  final String title = "Download & Extract ZIP";

  @override
  DownloadAssetsDemoState createState() => DownloadAssetsDemoState();
}

class DownloadAssetsDemoState extends State<DownloadAssetsDemo> {

  final String _zipPath = 'https://coderzheaven.com/youtube_flutter/images.zip';
  final String _localZipFileName = 'images.zip';

  @override
  void initState() {
    super.initState();
    _images = [];
    getHistoryImageList();
    _tempImages = [];
    _downloading = false;
    _initDir();
  }

  bool? _downloading;
   String? _dir;
  List<String>? _images, _tempImages;
  getHistoryImageList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _images = prefs.getStringList("images")!;
    });
  }

  _initDir() async {
    if (null == _dir) {
      _dir = (await getApplicationDocumentsDirectory()).path;
      print("init $_dir");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColour.appTheme,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.title,style: const TextStyle(color: Colors.white),),
        actions: <Widget>[
          _downloading == true ? progress() :  Container(),
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () {
              _downloadZip();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          buildList(),
        ],
      ),
    );
  }

  Future<File> _downloadFile(String url, String fileName) async {
    var req = await http.Client().get(Uri.parse(url));
    var file = File('$_dir/$fileName');
    print("file.path ${file.path}");
    return file.writeAsBytes(req.bodyBytes);
  }

  Future<void> _downloadZip() async {
    setState(() {
      _downloading = true;
    });

    _images?.clear();
    _tempImages?.clear();

    var zippedFile = await _downloadFile(_zipPath, _localZipFileName);
    await unarchiveAndSave(zippedFile);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("images", _tempImages!);
    setState(() {
      _images = List<String>.from(_tempImages as Iterable);
      _downloading = false;
    });
  }

  unarchiveAndSave(var zippedFile) async {
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    for (var file in archive) {
      var fileName = '$_dir/${file.name}';
      print(fileName);
      if (file.isFile && !fileName.contains("__MACOSX")) {
        var outFile = File(fileName);
        _tempImages?.add(outFile.path);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }

  buildList() {
    return _images == null ? Container() : Expanded(
      child: ListView.builder(
        itemCount: _images?.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.file(
            File(_images![index]),
            fit: BoxFit.fitWidth,
          );
        },
      ),
    );
  }

  progress() {
    return Container(
      width: 25,
      height: 25,
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 20.0),
      child: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

}