abstract class AuthRepository {
  Future sendSms(String phone);

  Future verifyCode(String phone, String code);

  Future noLoginVerify();
}
