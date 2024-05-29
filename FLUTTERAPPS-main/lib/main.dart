import 'dart:html';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(title: 'File Size Classifier',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: FileSelectorScreen(),);}}
class FileSelectorScreen extends StatefulWidget { @override
  _FileSelectorScreenState createState() => _FileSelectorScreenState();}
class _FileSelectorScreenState extends State<FileSelectorScreen> {
  List<Uint8List> _selectedFiles = [];
  Future<void> _pickFiles() async {
    final input = FileUploadInputElement()..multiple = true;
    input.click();
    input.onChange.listen((e) async {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        List<Uint8List> filesBytes = [];
        for (var file in files) {filesBytes.add(await _readFileAsBytes(file));}
        filesBytes.sort((a, b) => a.length - b.length);
        setState(() {_selectedFiles = filesBytes;
        });for (Uint8List fileBytes in _selectedFiles) {
          showFileSize(fileBytes);}}});}
  Future<Uint8List> _readFileAsBytes(File file) async {
    final reader = FileReader(); reader.readAsArrayBuffer(file);
    await reader.onLoad.first; return reader.result as Uint8List;}
  void showFileSize(Uint8List fileBytes) {
    int sizeInBytes = fileBytes.length;double sizeInMB = sizeInBytes / (1024 * 1024);
    String message = 'Size: ${sizeInMB.toStringAsFixed(2)} MB';
    Fluttertoast.showToast(msg: message, backgroundColor: sizeInMB > 10 ? Colors.red : Colors.green,);
    print(message);}
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('File Size Classifier'),),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(onPressed: _pickFiles,
              child: Text('Pick Files'),),SizedBox(height: 20),
            Text('Uploaded Files:', style: TextStyle(fontWeight: FontWeight.bold),
            ), SizedBox(height: 10), Expanded(child: ListView.builder(
                itemCount: _selectedFiles.length, itemBuilder: (context, index) {return ListTile(title: Text(
                        'File ${index + 1} - Size: ${(_selectedFiles[index].length / (1024 * 1024)).toStringAsFixed(2)} MB'),
                  );},),),],),),);}}
