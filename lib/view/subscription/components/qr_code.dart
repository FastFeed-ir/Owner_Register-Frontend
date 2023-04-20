import 'dart:typed_data';
import 'dart:ui';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:qr_flutter/qr_flutter.dart';
Future<void> createQr(String url)async{
  final unit8List = await _readImageData(url);
  _downloadImage(unit8List);
}
Future<void> _downloadImage(unit8List) async {
  await WebImageDownloader.downloadImageFromUInt8List(uInt8List: unit8List, name:"Qrcode.png", );
}
Future<Uint8List> _readImageData(String text) async {
  try {
    final image = await QrPainter(
      data: text,
      version: QrVersions.auto,
      gapless: false,
    ).toImage(400);

    final data = await image.toByteData(format: ImageByteFormat.png);
    final Uint8List bytes = data!.buffer.asUint8List();
    return bytes;
  } catch (e) {
    rethrow;
  }
}