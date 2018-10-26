import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

String _parseShareUrl(final String ShareUrl) {

}

String _getDownloadLink(final String cid, String quality, String client) {
  var baseLink = "https://interface.bilibili.com/v2/playurl?";
  var SEC1 = "94aba54af9065f71de72f5508f1cd42e";
  var appkey = "84956560bc028eb7";
  //var timestamp = new DateTime.now().millisecondsSinceEpoch;
  //params = 'cid={cid}&player={client}&quality=80&ts={timestamp}
  var params = "appkey=" + appkey + "&cid=" + cid + "&otype=xml&qn=" + quality + "&quality=" + quality + "&type=" + client;
  var sign = hex.encode((md5.convert(new Utf8Encoder().convert(SEC1))).bytes);
  var downLink = baseLink + params + "&sign=" + sign;
  return downLink;
}
