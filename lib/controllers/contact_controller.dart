import 'package:flutter/material.dart';
import '../services/email_service.dart';

class ContactController extends ChangeNotifier {
  final EmailService _emailService = EmailService();

  // Form Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // State
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _nameError;
  String? get nameError => _nameError;

  String? _emailError;
  String? get emailError => _emailError;

  String? _messageError;
  String? get messageError => _messageError;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    companyController.dispose();
    messageController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    bool isValid = true;
    _nameError = null;
    _emailError = null;
    _messageError = null;

    if (nameController.text.trim().isEmpty) {
      _nameError = 'Name is required';
      isValid = false;
    }

    final email = emailController.text.trim();
    if (email.isEmpty) {
      _emailError = 'Email is required';
      isValid = false;
    } else {
      final emailRegex = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      if (!emailRegex.hasMatch(email)) {
        _emailError = 'Please enter a valid email';
        isValid = false;
      }
    }

    if (messageController.text.trim().isEmpty) {
      _messageError = 'Message is required';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<bool> submitForm() async {
    // Prevent duplicate submissions
    if (_isLoading) return false;

    if (!_validateFields()) {
      return false;
    }

    _isLoading = true;
    notifyListeners();

    final success = await _emailService.sendEmail(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      company: companyController.text.trim(),
      message: messageController.text.trim(),
    );

    if (success) {
      // Clear form on success
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      companyController.clear();
      messageController.clear();
    }

    _isLoading = false;
    notifyListeners();

    return success;
  }
}
