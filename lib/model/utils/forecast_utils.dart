import 'package:intl/intl.dart';

class Util{
  static String appID = "ed60fcfbd110ee65c7150605ea8aceea"; 
  static String getFormattedDatetime(DateTime dateTime){
    return DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}