import 'ImageGetterStub.dart'
// ignore: uri_does_not_exist
    if (dart.library.io) 'package:happyathome/widgets/image_getter/AndroidImageGetter.dart'
// ignore: uri_does_not_exist
    if (dart.library.html) 'package:happyathome/widgets/image_getter/WebImageGetter.dart';

abstract class AbstractImageGetter {
  Future<dynamic> getImage();

  factory AbstractImageGetter() => getIt();
}
