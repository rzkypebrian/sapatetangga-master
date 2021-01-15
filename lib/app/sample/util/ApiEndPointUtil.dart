import 'package:enerren/util/ApiEndPointUtil.dart';

extension ApiEndPointUtilExtension on ApiEndPointUtil {
    ApiEndPointUtil sampleApiEndPoint(){
      this.baseUrl = "http://sbb.inovatrack.com/api/api/";
      this.baseUrlDebug = "http://sbb.inovatrack.com/api/api/";
      this.loginUrl = "Auth/Driver-login";
      return this;
    }

    ApiEndPointUtil sampleCustomerApiEndPoimt(){
      sampleApiEndPoint();
      this.checkAccountUrl = "Customers/checkusername";
      this.loginUrl = "Auth/customer-login";
      return this;
    }
}