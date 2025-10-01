import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 45, 45),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Botão de Voltar ---
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 20),

              // --- Título ---
              const Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // --- Username ---
              _buildLabel("Username"),
              const SizedBox(height: 8),
              _buildTextField(hint: "Digite seu username", icon: Icons.person),

              const SizedBox(height: 20),

              // --- Email ---
              _buildLabel("Email"),
              const SizedBox(height: 8),
              _buildTextField(
                hint: "Digite seu email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // --- Password ---
              _buildLabel("Password"),
              const SizedBox(height: 8),
              _buildTextField(
                hint: "Digite sua senha",
                icon: Icons.lock,
                obscureText: true,
              ),

              const SizedBox(height: 20),

              // --- Confirm Password ---
              _buildLabel("Confirm Password"),
              const SizedBox(height: 8),
              _buildTextField(
                hint: "Confirme sua senha",
                icon: Icons.lock,
                obscureText: true,
              ),

              const SizedBox(height: 30),

              // --- Botão Register ---
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Funções auxiliares para reduzir repetição ---
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 70, 68, 68),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
    );
  }
}
