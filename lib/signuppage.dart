import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jewelleryshopapp/specialoffer.dart';
import 'loginpage.dart'; // Login screen
import 'forgotpasswordpage.dart'; // Forgot password screen
class Jewellery extends StatefulWidget {
  @override
  State<Jewellery> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<Jewellery> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController conpassController = TextEditingController();
  bool isLoading = false;
  final Color gold = const Color(0xFFB8860B); // Dark Goldenrod
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1A1A1A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: SpinKitDancingSquare(color: gold, size: 45)),
                const SizedBox(height: 12),
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFFD700), Color(0xFFB8860B)],
                    ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: Text(
                      "Rao Jewellery",
                      style: GoogleFonts.dancingScript(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: gold,
                  ),
                ),
                Text(
                  "Create a new account",
                  style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                ),
                const SizedBox(height: 18),
                _buildTextField("Username", Icons.person, usernameController),
                _buildTextField("Email", Icons.mail, emailController),
                _buildTextField("Password", Icons.lock, passController, obscure: true),
                _buildTextField("Confirm Password", Icons.lock_outline, conpassController, obscure: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Jewellery2()),
                    ),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: gold, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildRegisterButton(),
                const SizedBox(height: 14),
                _buildGoogleSignInButton(),
                const SizedBox(height: 24),
                _buildSignInLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTextField(String hint, IconData icon, TextEditingController controller, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2A2A2A),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: gold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: gold),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: gold, width: 2),
          ),
        ),
      ),
    );
  }
  Widget _buildRegisterButton() {
    return Center(
      child: InkWell(
        onTap: isLoading ? null : _registerUser,
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFD700), Color(0xFFB8860B)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
              : const Text("Register", style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return Center(
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFD700), Color(0xFFB8860B)],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(1.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton.icon(
            onPressed: _signInWithGoogle,
            icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 30),
            label: const Text("Sign in with Google"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInLink() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(fontSize: 15, color: Colors.white70),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Jewellery1())),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFB8860B)],
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerUser() async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passController.text.trim();
    final confirmPass = conpassController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPass.isEmpty) {
      _showToast("Please fill all fields", isError: true);
      return;
    }

    if (password != confirmPass) {
      _showToast("Passwords do not match", isError: true);
      return;
    }

    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      _showToast("Account Created Successfully");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Jewellery1()));
    } on FirebaseAuthException catch (e) {
      _showToast(e.message ?? "Registration failed", isError: true);
    } finally {
      setState(() => isLoading = false);
    }
  }
  void _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      _showToast("Signed in with Google");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Offer()));
    } catch (e) {
      _showToast("Google Sign-In Failed", isError: true);
    }
  }
  void _showToast(String msg, {bool isError = false}) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
    );
  }
}
