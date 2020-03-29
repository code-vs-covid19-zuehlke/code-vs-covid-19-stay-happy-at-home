import 'package:flutter/widgets.dart';

import 'FallbackImage.dart';

class GoogleCloudImage {
  static ImageProvider get(String url) {
    if (url == null) {
      return FallbackImage.provider();
    }
    // hack to fix wrong URL in database:
    final fixedUrl = url.replaceAll("storage.cloud.google.com", "storage.googleapis.com");
    return NetworkImage(fixedUrl);
  }
}
