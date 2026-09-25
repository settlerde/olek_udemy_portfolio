import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:olek_udemy_portfolio/components.dart';
import 'package:olek_udemy_portfolio/content.dart';

/// Contact form shared by the landing and contact pages. Validates the input
/// and hands the message over to the visitor's mail client.
class ContactForm extends StatefulWidget {
  const ContactForm({required this.fieldWidth, this.twoColumns = true, super.key});

  final double fieldWidth;
  final bool twoColumns;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _message = TextEditingController();

  static final RegExp _emailPattern = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

  bool _sending = false;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phone.dispose();
    _message.dispose();
    super.dispose();
  }

  String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final missing = _required(value, 'Email');
    if (missing != null) return missing;
    if (!_emailPattern.hasMatch(value!.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length < 6) return 'Please enter a valid phone number';
    return null;
  }

  String? _validateMessage(String? value) {
    final missing = _required(value, 'Message');
    if (missing != null) return missing;
    if (value!.trim().length < 10) return 'Please write at least 10 characters';
    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      _notify('Please fix the highlighted fields.', isError: true);
      return;
    }

    setState(() => _sending = true);

    final body = StringBuffer()
      ..writeln('Name: ${_firstName.text.trim()} ${_lastName.text.trim()}')
      ..writeln('Email: ${_email.text.trim()}');
    if (_phone.text.trim().isNotEmpty) {
      body.writeln('Phone: ${_phone.text.trim()}');
    }
    body
      ..writeln()
      ..writeln(_message.text.trim());

    final mailto = Uri(
      scheme: 'mailto',
      path: Profile.email,
      queryParameters: <String, String>{
        'subject': 'Portfolio message from ${_firstName.text.trim()}',
        'body': body.toString(),
      },
    );

    final launched = await launchUrl(mailto);
    if (!mounted) return;
    setState(() => _sending = false);

    if (launched) {
      _formKey.currentState!.reset();
      for (final controller in [_firstName, _lastName, _email, _phone, _message]) {
        controller.clear();
      }
      _notify('Thanks! Your mail client should be open now.');
    } else {
      _notify(
        'Could not open a mail client. Please write to ${Profile.email}.',
        isError: true,
      );
    }
  }

  void _notify(String message, {bool isError = false}) {
    final scheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: isError
                  ? scheme.onErrorContainer
                  : scheme.onPrimaryContainer,
            ),
          ),
          backgroundColor: isError
              ? scheme.errorContainer
              : scheme.primaryContainer,
          closeIconColor: isError
              ? scheme.onErrorContainer
              : scheme.onPrimaryContainer,
          showCloseIcon: true,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final fields = <Widget>[
      TextForm(
        heading: 'First name',
        hintText: 'Please type your first name',
        width: widget.fieldWidth,
        controller: _firstName,
        validator: (value) => _required(value, 'First name'),
      ),
      TextForm(
        heading: 'Last name',
        hintText: 'Please type your last name',
        width: widget.fieldWidth,
        controller: _lastName,
        validator: (value) => _required(value, 'Last name'),
      ),
      TextForm(
        heading: 'Email',
        hintText: 'name@example.com',
        width: widget.fieldWidth,
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        validator: _validateEmail,
      ),
      TextForm(
        heading: 'Phone number (optional)',
        hintText: '+49 ...',
        width: widget.fieldWidth,
        controller: _phone,
        keyboardType: TextInputType.phone,
        validator: _validatePhone,
      ),
    ];

    final messageWidth = widget.twoColumns
        ? widget.fieldWidth * 2 + 24
        : widget.fieldWidth;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Wrap(
            spacing: 24,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: fields,
          ),
          const SizedBox(height: 20),
          TextForm(
            heading: 'Message',
            hintText: 'Write your message',
            width: messageWidth,
            maxLines: 6,
            controller: _message,
            validator: _validateMessage,
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _sending ? null : _submit,
            icon: _sending
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            label: Text(_sending ? 'Sending...' : 'Send message'),
          ),
        ],
      ),
    );
  }
}
