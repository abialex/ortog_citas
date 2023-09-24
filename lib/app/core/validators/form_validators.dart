import 'package:get/get.dart';

class FormValidators {
  static String? Function(String?) validatorMixin(
      List<String? Function(String?)> validators) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  static String? Function(T?) validatorMixinT<T>(
      List<String? Function(T?)> validators) {
    return (T? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error.toString();
        }
      }
      return null;
    };
  }

  static String? Function(T?) validatorRequiredT<T>(String message) {
    return (T? value) {
      if (value?.isBlank ?? true) {
        return message;
      }
      return null;
    };
  }

  static String? Function(String?) validatorRequired(String message) {
    return (String? value) {
      if (value?.isEmpty ?? true) {
        return message;
      }
      return null;
    };
  }

  static String? Function(String?) validatorLessThan60(
      int min, String message) {
    return (String? value) {
      if (value != null) {
        int number = int.parse(value.length == 0 ? "00" : value);
        if (number < min) {
          return null; // La validación pasó
        }
      }
      return message;
    };
  }

  static String? Function(String?) verificacionDNIRequired(String message) {
    return (String? value) {
      if ((value?.isEmpty ?? true)) {
        return message;
      }
      return null;
    };
  }

  static String? Function(String?) validatorMinLength(
      int minLength, String message) {
    return (String? value) {
      if (value != null && value.isNotEmpty) {
        if (value.length < minLength) {
          return message;
        }
      }
      return null;
    };
  }

  static String? Function(String?) validatorLength(int length, String message) {
    return (String? value) {
      if (value != null && value.isNotEmpty) {
        if (value.length != length) {
          return message;
        }
      }
      return null;
    };
  }

  static String? Function(String?) validatorRequiredDate(String message) {
    return (String? date) {
      if (date == null || date.isEmpty) {
        return message;
      }
      return null;
    };
  }

  static String? Function(String?) validatorEmail(String message) {
    return (String? email) {
      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(
          email != null
              ? (email.isEmpty ? "correo@gmail.com" : email)
              : "correo@gmail.com")) {
        return message;
      }
      return null;
    };
  }

  static String? Function(String?) validatorMinorDate(
    String minDate,
    String message,
  ) {
    return (String? value) {
      if (value != null && value.isNotEmpty) {
        if (DateTime.parse(value).isAfter(DateTime.parse(minDate))) {
          return message;
        }
      }
      return null;
    };
  }
}

// import 'package:intl/intl.dart';

// // class ValidationMixin {
// //   static dynamic combineValidations(
// //       List<dynamic Function(String?)>? validations) {
// //     if (validations == null || validations.isEmpty) {
// //       return null;
// //     }

// //     return (value) {
// //       for (final validation in validations) {
// //         final error = validation(value);
// //         if (error != null) {
// //           return error;
// //         }
// //       }
// //       return null;
// //     };
// //   }
// // }



// class FormValidation {
  
//   static String? Function(String? value) combine(List<String? Function(String?)> validators) {
//   return (String? value) {
//     for (final validator in validators) {
//       final error = validator(value);
//       if (error != null) {
//         return error;
//       }
//     }
//     return null;
//   };
// }

//   static String? requiredValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'This field is required';
//     }
//     return null;
//   }

//   static String? numericValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//     final number = num.tryParse(value);
//     if (number == null) {
//       return 'Please enter a valid number';
//     }
//     return null;
//   }

//   static String? emailValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

//   static String? minLengthValidator(String? value, int minLength) {
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//     if (value.length < minLength) {
//       return 'Please enter at least $minLength characters';
//     }
//     return null;
//   }

//   static String? maxLengthValidator(String? value, int maxLength) {
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//     if (value.length > maxLength) {
//       return 'Please enter no more than $maxLength characters';
//     }
//     return null;
//   }

//   static String? dateValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return null;
//     }
//     final dateFormat = DateFormat('yyyy-MM-dd');
//     try {
//       dateFormat.parseStrict(value);
//     } on FormatException {
//       return 'Please enter a valid date (yyyy-MM-dd)';
//     }
//     return null;
//   }
// }