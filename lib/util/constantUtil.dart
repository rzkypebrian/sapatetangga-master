class ConstantUtil {
  static const ship2D = "SHIP2D";
  static const alert2D = "ALT2D";
  static const messageType = "messageType";
  static const setting = "setting";
  static const title = "title";
  static const body = "body";
  static const userName = "userName";
  static const fullName = "fullName";
  static const regexPhoneNumberPhatern =
      r"^(^\+62\s?|^0)(\d{3,4}-?){2}\d{3,4}$";
  static const regexEmailPhatern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
  static const loginByGoogle = "Google";
  static const loginByFacebook = "Facebook";
}

class PrefsKey {
  static String user = "user";
  static String searchResiHistory = "searchResiHistory";
  static String pin = "pin";
  static String token = "token";
  static String pandingPod = "pandingPod";
}

enum UserType {
  Customer,
  Driver,
  Transporter,
  Admin,
}

enum TabName {
  Open,
  Process,
  Finish,
  Cancel,
}

class PendingDataType {
  static String podData = "podData";
}

class PendingDataStatus {
  static String inputNew = "inputNew";
  static String resend = "resend";
  static String failed = 'failed';
  static String sent = "terkirim";
}
