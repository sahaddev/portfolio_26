import 'dart:typed_data';
import 'dart:js_interop';

@JS()
@anonymous
extension type BlobPropertyBag._(JSObject _) implements JSObject {
  external factory BlobPropertyBag({String type});
}

@JS('Blob')
extension type JSBlob._(JSObject _) implements JSObject {
  external factory JSBlob(JSArray blobParts, [BlobPropertyBag options]);
}

@JS('URL.createObjectURL')
external String createObjectURL(JSBlob blob);

@JS('URL.revokeObjectURL')
external void revokeObjectURL(String url);

@JS('document.createElement')
external JSAnchorElement createElement(String tagName);

extension type JSAnchorElement._(JSObject _) implements JSObject {
  external set href(String value);
  external set download(String value);
  external void click();
}

void downloadPdfFromBytes(Uint8List bytes, String filename) {
  final jsBytes = bytes.toJS;
  final blob = JSBlob(
    [jsBytes].toJS,
    BlobPropertyBag(type: 'application/pdf'),
  );
  final url = createObjectURL(blob);
  final anchor = createElement('a')
    ..href = url
    ..download = filename;
  anchor.click();
  revokeObjectURL(url);
}
