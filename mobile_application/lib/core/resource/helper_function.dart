import 'package:url_launcher/url_launcher.dart';

void openMap(double latitude, double longitude) async {
  final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}