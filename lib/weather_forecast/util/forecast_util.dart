
import 'package:intl/intl.dart';

class Util{
  static String appId = "ed60fcfbd110ee65c7150605ea8aceea";

  static String? getForemattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}