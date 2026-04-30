import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = AuthService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1503220317375-aaad61436b1b?auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Welcome Back!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const Text("Login to continue your journey", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 30),

                  // Email Field
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : () async {
                        setState(() => _isLoading = true);
                        final user = await _auth.loginWithEmail(_emailController.text.trim(), _passwordController.text.trim());
                        setState(() => _isLoading = false);

                        if (user != null) {
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Failed. Please check your credentials.")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Google Sign-In Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton.icon(
                      onPressed: _isLoading ? null : () async {
                        setState(() => _isLoading = true);
                        final user = await _auth.signInWithGoogle();
                        setState(() => _isLoading = false);

                        if (user != null) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      icon: Image.asset(
                        'assets/google_logo.png',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text("Continue with Google", style: TextStyle(fontSize: 16, color: Colors.black87)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen())),
                        child: const Text("Register Now"),
                      ),
                    ],
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