import "dart:convert";
import "dart:typed_data";

class ImageUtils {
  /// Encodes an image (in bytes) into a Base64 string
  static String encodeImage(Uint8List imageBytes) {
    return base64Encode(imageBytes);
  }

  /// Decodes a Base64 string back into image bytes
  static Uint8List decodeImage(String base64String) {
    return base64Decode(base64String);
  }

  /// Converts a Base64 string into an image data URL (useful for web apps)
  static String base64ToDataUrl(String base64String,
      {String mimeType = 'image/png'}) {
    return 'data:$mimeType;base64,$base64String';
  }

  /// Extracts Base64 data from a Base64 image data URL
  static String extractBase64FromDataUrl(String dataUrl) {
    final parts = dataUrl.split(',');
    if (parts.length == 2) {
      return parts[1];
    }
    return dataUrl; // Return as is if it's not a valid data URL
  }
}
