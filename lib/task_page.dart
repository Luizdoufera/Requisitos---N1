import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F2D2D),

      // --- AppBar ---
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F2D2D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // abrir menu lateral futuramente
          },
        ),
        title: const Text(
          "Index",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              // ação do usuário futuramente
            },
          ),
        ],
      ),

      // --- Corpo ---
      body: const Center(
        child: Text(
          "What do you want to do today?",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      // --- Botão de adicionar tarefa ---
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          // abrir tela de criação de tarefa
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
