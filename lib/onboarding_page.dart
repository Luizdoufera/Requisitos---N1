import 'package:flutter/material.dart';
import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "Manage your tasks",
      "subtitle":
          "You can easily manage all of your daily\ntasks in DoMe for free",
    },
    {
      "title": "Create daily routine",
      "subtitle":
          "In Uptodo you can create your\npersonalized routine to stay productive",
    },
    {
      "title": "Organize your tasks",
      "subtitle":
          "You can organize your daily tasks by\nadding your tasks into separate categories",
    },
  ];

  bool _showLogo = true;

  @override
  void initState() {
    super.initState();
    // Mostrar logo por 5 segundos
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _showLogo = false;
      });
    });
  }

  Widget _buildPageContent(Map<String, String> page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          page["title"]!,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          page["subtitle"]!,
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 180, 180, 180),
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    VoidCallback onPressed, {
    double horizontalPadding = 32,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.deepPurple, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: horizontalPadding,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 45, 45),
      body: SafeArea(
        child: _showLogo
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check_box, size: 140, color: Colors.deepPurple),
                    SizedBox(height: 10),
                    Text(
                      "Uptodo",
                      style: TextStyle(
                        fontSize: 47,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _buildPageContent(_pages[index]);
                    },
                  ),
                  // --- Skip ---
                  Positioned(
                    top: 20,
                    left: 20,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  // --- Indicadores ---
                  Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.deepPurple
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // --- Back e Next ---
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _currentPage > 0
                            ? _buildButton("Back", () {
                                _controller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }, horizontalPadding: 20)
                            : const SizedBox(width: 100),
                        _buildButton(
                          _currentPage == _pages.length - 1 ? "Finish" : "Next",
                          () {
                            if (_currentPage == _pages.length - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(),
                                ),
                              );
                            } else {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
