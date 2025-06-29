import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../core/theme.dart';
import '../class/contact_model.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color, width: 1.5),
    );
  }

  Future<void> _saveMessage() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    final box = await Hive.openBox('contact_messages');
    final contactMessage = ContactMessage(
      name: name,
      email: email,
      message: message,
      timestamp: DateTime.now(),
    );

    await box.add(contactMessage.toMap());

    // ignore: avoid_print
    print('Mensajes guardados:');
    for (var i = 0; i < box.length; i++) {
      // ignore: avoid_print
      print(box.getAt(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            '¡Haz tu pedido o reserva! 🍕',
            style: AppTextStyles.body.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.accent,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Center(
            child: SizedBox(
              width: 620,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: _inputBorder(Colors.grey.shade300),
                        enabledBorder: _inputBorder(Colors.grey.shade300),
                        focusedBorder: _inputBorder(AppColors.accent),
                        errorBorder: _inputBorder(Colors.red.shade700),
                        focusedErrorBorder: _inputBorder(Colors.red.shade700),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Ingrese su nombre'
                          : null,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: _inputBorder(Colors.grey.shade300),
                        enabledBorder: _inputBorder(Colors.grey.shade300),
                        focusedBorder: _inputBorder(AppColors.accent),
                        errorBorder: _inputBorder(Colors.red.shade700),
                        focusedErrorBorder: _inputBorder(Colors.red.shade700),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese su correo';
                        }
                        final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Correo inválido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        labelText: 'Mensaje o Pedido',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: _inputBorder(Colors.grey.shade300),
                        enabledBorder: _inputBorder(Colors.grey.shade300),
                        focusedBorder: _inputBorder(AppColors.accent),
                        errorBorder: _inputBorder(Colors.red.shade700),
                        focusedErrorBorder: _inputBorder(Colors.red.shade700),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                      maxLines: 5,
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Ingrese un mensaje'
                          : null,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _saveMessage();

                          if (!mounted) return;

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Mensaje enviado')),
                          );
                          _formKey.currentState!.reset();
                          _nameController.clear();
                          _emailController.clear();
                          _messageController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 20,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 6,
                        // ignore: deprecated_member_use
                        shadowColor: AppColors.accent.withOpacity(0.6),
                      ),
                      child: const Text('Enviar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
