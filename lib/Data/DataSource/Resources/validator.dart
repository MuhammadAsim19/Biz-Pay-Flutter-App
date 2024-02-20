class Validate {
  ///Password Validation
  static String? password(String? val) {
    if (val == null || val.trim().isEmpty) {
      return "Please provide a password";
    } else if (val.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!_containsUpperCase(val)) {
      return 'Password must contain one uppercase letter';
    } else if (!_containsNumber(val)) {
      return 'Password must contain one number';
    } else if (!_containsSpecialCharacter(val)) {
      return 'Password must contain one special character';
    }
    return null;
  }

  static String? loginPassword(String? val) {
    if (val == null || val.trim().isEmpty) {
      return "Please provide a password";
    } else if (val.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static bool _containsUpperCase(String val) {
    return val.contains(RegExp(r'[A-Z]'));
  }

  static bool _containsNumber(String val) {
    return val.contains(RegExp(r'[0-9]'));
  }

  static bool _containsSpecialCharacter(String val) {
    return val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  ///Confirm Password Validation
  static String? confirmPassword(val, String? pass) {
    if (val!.trim().isEmpty) {
      return "Please provide Password";
    } else if (val.length != pass?.length) {
      return 'Password length does not match';
    } else if (val != pass) {
      return 'Password does not match';
    }
    return null;
  }

  ///Email Validation
  static String? email(val) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
    if (val.isEmpty) {
      return "Please provide email";
    } else if (!emailValid) {
      return 'Invalid Email (i.e): abcd123@domain.com';
    }
    if (val.isEmpty) {
      return "Please provide Email";
    }
    return null;
  }

  ///Debit or Credit card number
  static String? cardNumber(val) {
    // Regular expression to validate a 16-digit debit card number
    RegExp cardNumberRegExp = RegExp(r'^\d{16}$');

    if (cardNumberRegExp.hasMatch(val)) {
      return null;
    } else {
      return "Invalid card number";
    }
  }

  static String? cardDate(val) {
    // Regular expression to validate a card expiration date in MM/YY format
    RegExp expirationDateRegExp = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');

    if (expirationDateRegExp.hasMatch(val)) {
      return null;
    } else {
      return "Invalid card Date, Format must MM/YY";
    }
  }

  static String? CVV(val) {
    // Regular expression to validate a CVV with 3 or 4 digits
    RegExp cvvRegExp = RegExp(r'^\d{3,4}$');

    if (cvvRegExp.hasMatch(val)) {
      return null;
    } else {
      return "Invalid CVV Code";
    }
  }

  ///Name validation
  static String? name(String? val) {
    // bool isValidName =
    //     RegExp(r"^[a-zA-Z][a-zA-Z\s]{0,20}[a-zA-Z]$").hasMatch(val!);
    if (val!.isEmpty) {
      return 'Please add a $val';
    }
    return null;
  }

  ///Phone Number Validation
  static String? phone(String? val) {
    // if (val!.isEmpty) {
    //   return 'Provide a phone number';
    // } else if (val.length < 8) {
    //   return 'Length must be greater than 8';
    // }
    return null;
  }

  ///Phone Number Validation
  static String? percentage(v) {
    if (v!.isEmpty) {
      return 'Please Enter a %age';
    } else if (double.parse(v) > 100) {
      return 'Percentage cannot be exceeded 100';
    }

    return null;
  }

  ///Description Validation
  static String? descriptions(v) {
    if (v!.isEmpty) {
      return 'Please enter a descriptions';
    }

    return null;
  }

  ///This may be title,subject,heading
  ///must be at least 50 Alphabets
  static String? subject(String? v) {
    if (v!.isEmpty) {
      return 'Please Enter a Descriptions';
    }
    if (v.length < 50) {
      return 'Please Enter at least 50 Alphabets';
    }

    return null;
  }

  static String? rangeDescriptions(v) {
    if (v!.isEmpty) {
      return 'Please enter a descriptions';
    } else if (v.toString().length < 500 && v.toString().length > 1500) {
      return 'Descriptions must be between 500 and 1500 characters.';
    }

    return null;
  }

  static String? priceTo(String min, String max) {
    if (max.isEmpty) {
      return 'Please enter a Maximum Price';
    } else if (double.parse(min == "" ? "0" : min) > double.parse(max)) {
      return 'This value must be max';
    }
    if (double.parse(min == "" ? "0" : min) == double.parse(max)) {
      return "Both values cannot be same";
    }

    return null;
  }

  static String? priceFrom(String min, String max) {
    if (min.isEmpty) {
      return 'Please enter a Minimum Price';
    } else if (double.parse(min) > double.parse(max == "" ? "0" : max)) {
      return 'This value must be less';
    }
    if (double.parse(min) == double.parse(max == "" ? "0" : max)) {
      return "Both values cannot be same";
    }

    return null;
  }

  ///Kilometer (KMs) Driven
  static String? kmDriven(String? v) {
    if (v!.isEmpty) {
      return 'Please enter a KMs driven';
    }
    return null;
  }

  /// total No of seats in a vehicle
  static String? noOfSeats(String? v) {
    if (v!.isEmpty) {
      return 'Please enter a number of seats';
    }
    return null;
  }

  ///Total mileage
  static String? mileAge(String? v) {
    if (v!.isEmpty) {
      return 'Please enter a Mileage';
    }
    return null;
  }

  ///Engine type / CC
  static String? engineType(String? v) {
    if (v!.isEmpty) {
      return 'Please enter a engine type/cc';
    }
    return null;
  }

  ///Company / Manufacturer name
  static String? companyName(String? v) {
    if (v!.isEmpty) {
      return 'Please enter a company/manufacturer name';
    }
    return null;
  }

  ///Area
  static String? area(String? v) {
    if (v!.isEmpty) {
      return 'Please enter area';
    }
    return null;
  }

  ///DOB
  static String? dob(String? v) {
    // if (v!.isEmpty) {
    //   return 'Please enter DOB';
    // }
    return null;
  }

  ///Category
  static String? categorySelection(String? v) {
    if (v!.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  ///Domain URL
  static String? url(String? v) {
    RegExp regExp = RegExp(r"^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (v!.isEmpty) {
      return 'Please enter a domain';
    }

    if (!regExp.hasMatch(v)) {
      return 'Invalid domain format';
    }

    return null;
  }
}
