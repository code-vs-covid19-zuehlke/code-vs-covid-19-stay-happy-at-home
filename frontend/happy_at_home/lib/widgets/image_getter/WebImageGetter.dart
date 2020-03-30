import 'package:happyathome/widgets/image_getter/AbstractImageGetter.dart';
import 'package:image_picker_web/image_picker_web.dart';

class WebImageGetter implements AbstractImageGetter{

  Future<dynamic> getImage() async {
    return ImagePickerWeb.getImage(outputType: ImageType.bytes);
  }
}

AbstractImageGetter getIt() => WebImageGetter();


