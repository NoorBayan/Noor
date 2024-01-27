import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

import 'custom_logger.dart';

class UrlHelper {
  static Future<bool> customLaunchUrl(
    String url, {
    bool launchOnBrowserIfNotFoundAppHandel = true,
    bool forceWebView = false,
  }) async {
    bool isOpened = false;
    final uri = Uri.parse(url);

    logger.i("url $uri");
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        isOpened = true;
      } else {
        if (launchOnBrowserIfNotFoundAppHandel) {
          await launchUrlWithBrowser(url, forceWebView: forceWebView);
          isOpened = true;
        }
      }
    } catch (e) {
      logger.e(e);
    }
    return isOpened;
  }

  static Future launchUrlWithBrowser(
    String url, {
    bool forceWebView = false,
  }) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri,
          mode: forceWebView
              ? LaunchMode.inAppWebView
              : LaunchMode.externalApplication);
    } catch (e) {
      logger.e(e);
      throw 'Could not launch $url';
    }
  }

  static String joinPath(String path1, String? path2,
      {bool addHttpIfNeeded = true}) {
    String path = p.join(path1, path2);

    if (addHttpIfNeeded) {
      if (path.startsWith("http")) {
        return path;
      } else {
        return "https://$path";
      }
    } else {
      return path;
    }
  }

  static Future launchPhoneCall(
    String phoneNumber, {
    bool withoutThrowError = true,
  }) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await customLaunchUrl(url);
    } else {
      logger.e('Could not launch $url');
      if (!withoutThrowError) {
        throw 'Could not launch $url';
      }
    }
  }

  static Future launchEmail(
    String email, {
    bool withoutThrowError = true,
  }) async {
    String url = 'mailto:$email';
    if (await canLaunchUrl(Uri.parse(url))) {
      await customLaunchUrl(url);
    } else {
      logger.e('Could not launch $url');
      if (!withoutThrowError) {
        throw 'Could not launch $url';
      }
    }
  }

  static Future launchWhatsapp(
    String phoneNumber, {
    bool withoutThrowError = true,
  }) async {
    final String url;

    url = 'https://wa.me/$phoneNumber';
    await launchUrlWithBrowser(url);
  }

  static Future launchGoogleMapByLatLng(double latitude, double longitude) {
    String url =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    return customLaunchUrl(url);
  }
}
