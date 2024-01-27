import 'dart:io';
import 'dart:math';

// import 'package:android_path_provider/android_path_provider.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:better_open_file/better_open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// import 'package:pdf_render/pdf_render.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

import '../helpers/custom_logger.dart';

enum FileType {
  image,
  video,
  document,
  pdf,
  other,
}

class FileUtil {
  // list of image extensions
  static final List<String> imageExtensions = [
    'jpg',
    'jpeg',
    'png',
    // 'gif',
    // 'bmp',
    // 'webp',
  ];

  // list of video extensions
  static final List<String> videoExtensions = [
    'mp4',
    // 'mov',
    // 'avi',
    // 'mkv',
    // 'wmv',
    // 'flv',
    // '3gp',
    // 'm4v',
    // 'mts',
    // 'ts',
    // 'webm',
    // 'mpg',
    // 'mpeg',
  ];

  // list of video extensions
  static final List<String> audioExtensions = [
    'wav',
    'aac',
    // 'mp3',
    // 'flac',
    // 'ogg',
  ];

  // list of document extensions
  static final List<String> documentExtensions = [
    'doc',
    'docx',
    'xls',
    'xlsx',
    'ppt',
    'pptx',
    'pdf',
    'txt',
    'rtf',
  ];

  static FileType getFileType(String fileName) {
    final ext = fileName.split('.').last;

    if (imageExtensions.contains(ext)) {
      return FileType.image;
    } else if (videoExtensions.contains(ext)) {
      return FileType.video;
    } else if (documentExtensions.contains(ext)) {
      if (ext == 'pdf') {
        return FileType.pdf;
      }
      return FileType.document;
    } else {
      return FileType.other;
    }
  }

  static String defaultThumbnailName = '_thumbnail.jpg';

  // static Future<String?> makeThumbnailFileFromVideoFile(String filePath,
  //     {String? thumbnailPath, bool addThumbnailInSameDirectory = false}) async {
  //   final ext = filePath.split('.').last;

  //   String _thumbnailFilePath;
  //   if (addThumbnailInSameDirectory) {
  //     _thumbnailFilePath = '$filePath+$defaultThumbnailName';
  //   } else {
  //     _thumbnailFilePath = thumbnailPath ??
  //         (await getTemporaryDirectory()).path +
  //             '/' +
  //             filePath
  //                 .split('/')
  //                 .last
  //                 .replaceAll('.$ext', defaultThumbnailName);
  //   }

  //   return await VideoThumbnail.thumbnailFile(
  //     video: filePath,
  //     thumbnailPath: _thumbnailFilePath,
  //     imageFormat: ImageFormat.JPEG,
  //     maxHeight: 100,
  //     maxWidth: 100,
  //     quality: 100,
  //   );
  // }

  static double getSizeOfFiles(List<String> files) {
    double totalSize = 0;

    for (var file in files) {
      totalSize += getFileSize(file);
    }

    return totalSize;
  }

  static double convertBytesToMB(double size) {
    double sizeMb = (size / (1024 * 1024));

    return sizeMb;
  }

  static String stringifyBytes(double size) {
    if (size < 1024) {
      return '${size.toStringAsFixed(2)} bytes';
    } else if (size < 1024 * 1024) {
      return '${(size / 1024).toStringAsFixed(2)} KB';
    } else if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else {
      return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }
  
  static Future<String> getFilePathInTempDir(String fileName) async {
    final directory = await getTemporaryDirectory();
    return p.join(directory.path, fileName);
  }

  static String formatBytes(bytes, decimals) {
    if (bytes == 0) return '0.0';
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }

  static double getFileSize(String path) {
    final stat = FileStat.statSync(path);
    return stat.size + 0.0;
  }

  static Future<String> get tempDir async {
    final dir = await path_provider.getTemporaryDirectory();
    return dir.path;
    // return (await getTemporaryDirectory()).path + '/';
  }
  
  //   static Future<String> getAndPrepareExternalSaveDir() async {
  //   String _localPath = (await _findLocalPath())!;
  //   final savedDir = Directory(_localPath);
  //   bool hasExisted = await savedDir.exists();
  //   if (!hasExisted) {
  //     savedDir.create();
  //   }
  //   return _localPath;
  // }

  // static Future<String?> _findLocalPath() async {
  //   String? externalStorageDirPath;
  //   if (Platform.isAndroid) {
  //     try {
  //       externalStorageDirPath = await AndroidPathProvider.downloadsPath;
  //     } catch (e) {
  //       final directory = await getExternalStorageDirectory();
  //       externalStorageDirPath = directory?.path;
  //     }
  //   } else if (Platform.isIOS) {
  //     externalStorageDirPath =
  //         (await getApplicationDocumentsDirectory()).absolute.path;
  //   }
  //   return externalStorageDirPath;
  // }

  // static Future<double> getFileSizeFromUrl(String url) async {
  //   try {
  //     Uri uri = Uri.parse(url);
  //     double size = 0;

  //     // final response = await http.get(uri);
  //     // size = response.bodyBytes.length.toDouble();

  //     http.Response r = await http.head(uri);
  //     size = double.parse(r.headers["content-length"]!);

  //     return size;
  //   } catch (e) {
  //     debugModePrint(e);
  //     return -1;
  //   }
  // }

  static String getFileName(String filePath) {
    return p.basename(filePath);
    // return filePath.split('/').last;
  }

  static Future<File> getFileFromAssets(String path) async {
    final Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    final String rootPath = directory.path;
    final byteData = await rootBundle.load('$path');
    final file = File('$rootPath/${path.split('/').last}');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  static MediaType getMediaTypeByFilePath(String filePath) {
    String mediaType =
        lookupMimeType(filePath) ?? 'application/octet-stream'; // from dio lib

    logger.i('mediaType filePath: $filePath');
    logger.i('mediaType: $mediaType');
    return MediaType.parse(mediaType);
  }

  static MediaType getMediaType(String fileName) {
    final ext = fileName.split('.').last;

    if (imageExtensions.contains(ext)) {
      return MediaType('image', 'jpeg'); // TODO: setup other image types
    } else if (videoExtensions.contains(ext)) {
      return MediaType('video', ext);
    } else if (audioExtensions.contains(ext)) {
      return MediaType('audio', ext);
    } else if (documentExtensions.contains(ext)) {
      // return MediaType('document', ext);
      return MediaType('application', ext);
    } else {
      return MediaType.parse("application/octet-stream"); // from dio lib
    }
  }

  static Future openFile(String path, {String? type}) async {
    final _result = await OpenFile.open(path, type: type);
    return _result;
  }

  // static Future<String?> generateMD5File(String filePath) async {
  //   String? value;
  //   var file = File(filePath);
  //   if (await file.exists()) {
  //     try {
  //       value = await Md5FileChecksum.getFileChecksum(filePath: filePath);
  //     } catch (exception) {
  //       logger.e('Unable to evaluate the MD5 sum :$exception');
  //       return value;
  //     }
  //   } else {
  //     logger.e(
  //         '`$filePath` does not exits so unable to evaluate its MD5 sum.');
  //     return value;
  //   }
  //   return value;
  // }

  // static Future<String?> generateMD5FileWithCrypto(String filePath) async {
  //   String? value;
  //   var file = File(filePath);
  //   if (await file.exists()) {
  //     try {
  //       var hash = await md5.bind(file.openRead()).first;
  //       value = base64.encode(hash.bytes);
  //     } catch (exception) {
  //       debugModePrint('Unable to evaluate the MD5 sum :$exception');
  //       return value;
  //     }
  //   } else {
  //     debugModePrint('`$filePath` does not exits so unable to evaluate its MD5 sum.');
  //     return value;
  //   }
  //   return value;
  // }
}
