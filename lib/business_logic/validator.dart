class Validator{
  List<String> listWeakPassword = [
    '12345678',
    '87654321',
    'qwertyui',
    'asdfghjk',
    'zxcvbnm,',
    '11111111',
    '22222222',
    '33333333',
    '44444444',
    '55555555',
    '66666666',
    '77777777',
    '88888888',
    '99999999',
    '00000000',
  ];

  bool isEmail(String email){
    RegExp regExp = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regExp.hasMatch(email);
  }

  bool isWeakPassword(String password){
    return password.length < 8 || listWeakPassword.contains(password);
  }
}