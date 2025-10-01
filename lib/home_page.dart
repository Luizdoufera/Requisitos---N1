import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 45, 45),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- Logotipo ---
              const Icon(Icons.check_box, size: 140, color: Colors.deepPurple),
              const SizedBox(height: 10),

              const Text(
                "Uptodo",
                style: TextStyle(
                  fontSize: 47, // tamanho da fonte
                  fontWeight: FontWeight.bold, // em negrito
                  color: Colors.white, // branco
                  letterSpacing: 2, // espaçamento entre letras
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Please login to your account or create new account to continue",
                style: TextStyle(
                  fontSize: 18, // tamanho da fonte
                  fontWeight: FontWeight.bold, // em negrito
                  color: Color.fromARGB(255, 82, 80, 80), // branco
                  letterSpacing: 2, // espaçamento entre letras
                ),
              ),
              const SizedBox(height: 250),

              // --- Botão de Login ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // cor de fundo
                  foregroundColor: Colors.white, // cor do texto/ícone
                  side: const BorderSide(
                    // contorno
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    // formato do botão
                    borderRadius: BorderRadius.circular(
                      7,
                    ), // quanto maior o valor, mais arredondado
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 64,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 16),

              // --- Botão de Criar Conta ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // cor de fundo
                  foregroundColor: Colors.white, // cor do texto/ícone
                  side: const BorderSide(
                    // contorno
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    // formato do botão
                    borderRadius: BorderRadius.circular(
                      7,
                    ), // quanto maior o valor, mais arredondado
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  "Criar Conta",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
