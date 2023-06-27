class PasportData {

  String type = '';
  String nationality = '';
  String surname = '';
  String givenName = '';
  String passportNumber = '';
  String issuingCountry = '';
  String birthDate = '';
  String gender = '';
  String expiration = '';

  PasportData({
        required this.type,
        required this.nationality,
        required this.surname,
        required this.givenName,
        required this.passportNumber,
        required this.issuingCountry,
        required this.birthDate,
        required this.gender,
        required this.expiration
      });
}