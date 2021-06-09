class Shipping {
  String _firstName;
  String _lastName;
  String _company;
  String _address1;
  String _address2;
  String _city;
  String _postcode;
  String _country;
  String _state;
  String _email;
  String _phone;

  Shipping(
      {String firstName,
        String lastName,
        String company,
        String address1,
        String address2,
        String city,
        String postcode,
        String country,
        String state,
        String email,
        String phone}) {
    this._firstName = firstName;
    this._lastName = lastName;
    this._company = company;
    this._address1 = address1;
    this._address2 = address2;
    this._city = city;
    this._postcode = postcode;
    this._country = country;
    this._state = state;
    this._email = email;
    this._phone = phone;
  }

  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get company => _company;
  set company(String company) => _company = company;
  String get address1 => _address1;
  set address1(String address1) => _address1 = address1;
  String get address2 => _address2;
  set address2(String address2) => _address2 = address2;
  String get city => _city;
  set city(String city) => _city = city;
  String get postcode => _postcode;
  set postcode(String postcode) => _postcode = postcode;
  String get country => _country;
  set country(String country) => _country = country;
  String get state => _state;
  set state(String state) => _state = state;
  String get email => _email;
  set email(String email) => _email = email;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;

  Shipping.fromJson(Map<String, dynamic> json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _company = json['company'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _postcode = json['postcode'];
    _country = json['country'];
    _state = json['state'];
    _email = json['email'];
    _phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['company'] = this._company;
    data['address_1'] = this._address1;
    data['address_2'] = this._address2;
    data['city'] = this._city;
    data['postcode'] = this._postcode;
    data['country'] = this._country;
    data['state'] = this._state;
    data['email'] = this._email;
    data['phone'] = this._phone;
    return data;
  }
}