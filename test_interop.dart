import 'dart:js_interop';
import 'dart:typed_data';

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

void test() {
  final bytes = Uint8List(10);
  final blob = JSBlob([bytes.toJS].toJS, BlobPropertyBag(type: 'application/pdf'));
  final url = createObjectURL(blob);
  createElement('a')
    ..href = url
    ..download = 'test.pdf'
    ..click();
  revokeObjectURL(url);
}
