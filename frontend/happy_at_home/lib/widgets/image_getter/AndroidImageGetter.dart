import 'package:happyathome/widgets/image_getter/AbstractImageGetter.dart';

class AndroidImageGetter implements AbstractImageGetter{

  Future<dynamic> getImage() async {
   throw UnsupportedError('Not supported on Android.');
  }
}

AbstractImageGetter getIt() => AndroidImageGetter();


