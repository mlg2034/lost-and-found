abstract class AuthRepository {
  Future sendSms(String phone);

  Future verifyCode(String phone, int code);

  // Future noLoginVerify();
}
