import 'package:enerren/util/ApiEndPointUtil.dart';

extension ApiEndPointUtilExtension on ApiEndPointUtil {
  ApiEndPointUtil tmsApiEndPoint() {
    this.baseUrl = "http://dev.enerren.com/TMSAPI/api/";
    this.baseUrlDebug = "http://dev.enerren.com/TMSAPI/api/";
    // this.baseUrl = "http://dev.enerren.com/InovaTMSAPI/api/";
    // this.baseUrlDebug = "http://dev.enerren.com/InovaTMSAPI/api/";
    this.loginUrl = "Auth/Driver-login";
    this.changePasswordUrl = "Drivers/createpassword";
    this.changePasswordUrl = "Drivers/changepassword";
    return this;
  }

  ApiEndPointUtil tmsCustomerApiEndPoimt() {
    tmsApiEndPoint();
    this.checkAccountUrl = "Customers/checkusername";
    this.loginUrl = "Auth/customer-login";
    this.createPasswordUrl = "Customers/createpassword";
    this.changePasswordUrl = "Customers/changepassword";
    this.thirdPartyLoginUrl = "Auth/Customers-thirdparty-login";
    return this;
  }

  ApiEndPointUtil tmsTransporterApiEndPoimt() {
    tmsApiEndPoint();
    this.checkAccountUrl = "Transporter/checkusername";
    this.loginUrl = "Auth/transporter-login";
    this.createPasswordUrl = "Transporter/createpassword";
    this.changePasswordUrl = "Transporter/changepassword";
    return this;
  }

  ApiEndPointUtil tmsAdminApiEndPoint() {
    tmsApiEndPoint();
    tmsTransporterApiEndPoimt();
    this.loginUrl = "Auth/admin-login";
    this.getTmsListVehicleUrl = "Shipment/getVehicleTransporterAdminList";
    return this;
  }
}
