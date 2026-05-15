import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_text_form_field.dart';
import 'package:portfolio/components/message_status_widget.dart';
import 'package:portfolio/components/send_message_button.dart';
import 'package:portfolio/services/send_email.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/utils/app_validators.dart';
import 'package:portfolio/utils/extensions/context_extension.dart';

class ContactFormBox extends StatefulWidget {
  const ContactFormBox({super.key});

  @override
  State<ContactFormBox> createState() => _ContactFormBoxState();
}

class _ContactFormBoxState extends State<ContactFormBox> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _subjectController;
  late final TextEditingController _messageController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final ValueNotifier<AutovalidateMode> _autovalidateMode;

  late final ValueNotifier<bool?> _isSuccess;

  @override
  void initState() {
    super.initState();
    _autovalidateMode = ValueNotifier(AutovalidateMode.disabled);
    _isSuccess = ValueNotifier(null);
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _subjectController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _autovalidateMode.dispose();
    _isSuccess.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !context.isMobile
          ? EdgeInsets.all(48)
          : EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.windsorBlue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.ebonyClay,
          width: 1,
        ),
      ),
      child: Column(
        spacing: 24,
        children: [
          ValueListenableBuilder(
            valueListenable: _autovalidateMode,
            builder: (context, autovalidateMode, child) => Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                spacing: 24,
                children: [
                  (!context.isMobile)
                      ? Row(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                controller: _nameController,
                                hintText: "John Doe",
                                labelText: "FULL NAME",
                                validator: AppValidators.validateFullName,
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: _emailController,
                                hintText: "john@example.com",
                                labelText: "EMAIL ADDRESS",
                                validator: AppValidators.validateEmail,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          spacing: 24,
                          children: [
                            CustomTextFormField(
                              controller: _nameController,
                              hintText: "John Doe",
                              labelText: "FULL NAME",
                              validator: AppValidators.validateFullName,
                            ),
                            CustomTextFormField(
                              controller: _emailController,
                              hintText: "john@example.com",
                              labelText: "EMAIL ADDRESS",
                              validator: AppValidators.validateEmail,
                            ),
                          ],
                        ),
                  CustomTextFormField(
                    controller: _subjectController,
                    hintText: "What would you like to build?",
                    labelText: "SUBJECT",
                    validator: AppValidators.validateSubject,
                  ),
                  CustomTextFormField(
                    controller: _messageController,
                    hintText:
                        "Share your idea, project details, or opportunity…",
                    labelText: "MESSAGE",
                    maxLines: 5,
                    validator: AppValidators.validateMessage,
                  ),
                ],
              ),
            ),
          ),
          SendMessageButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _sendMessage();
              } else {
                _autovalidateMode.value = AutovalidateMode.always;
              }
            },
          ),
          ValueListenableBuilder(
            valueListenable: _isSuccess,
            builder: (context, isSuccess, child) => MessageStatusWidget(
              isSuccess: isSuccess,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    _isSuccess.value = await sendEmail(
      name: _nameController.text,
      email: _emailController.text,
      subject: _subjectController.text,
      message: _messageController.text,
    );
    if (_isSuccess.value == true) {
      _clearForm();
      if (_autovalidateMode.value != AutovalidateMode.disabled) {
        _autovalidateMode.value = AutovalidateMode.disabled;
      }
    }
    Future.delayed(const Duration(seconds: 5), () {
      _isSuccess.value = null;
    });
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }
}
