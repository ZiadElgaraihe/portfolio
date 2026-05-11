abstract class AppValidators {
  static String? validateFullName(String? newValue){
    if (newValue == null || newValue.trim().isEmpty) {
      return 'Full name is required';
    } else if(newValue.trim().length < 3) {
      return 'Full name must be at least 3 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email address is required";
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address";
    }

    return null;
  }

  static String? validateSubject(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Subject is required";
    }
    if (value.trim().length < 5) {
      return "Subject is too short (min 5 characters)";
    }
    return null;
  }

  // Validator للـ Message
  static String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Message is required";
    }
    if (value.trim().length < 10) {
      return "Tell me a bit more! (min 10 characters)";
    }
    return null;
  }
}