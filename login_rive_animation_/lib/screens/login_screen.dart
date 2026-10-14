import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Control para mostrar/ocultar la contraseña
  bool _isObsure = true;

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Contiene la animación de Rive
              SizedBox(
                width: screenSize.width,
                height: 200,
                child: const RiveAnimation.asset(
                  'assets/bear.riv',
                ),
              ),
              // Para separar el RiveAnimation del resto de los elementos
              const SizedBox(height: 10),
              // TextField del email, con el tipo de teclado correspondiente
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Contraseña
              TextField(
                obscureText: _isObsure,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    // Icono para mostrar/ocultar la contraseña
                    icon: Icon(
                      _isObsure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Para refrescar el icono
                      setState(() {
                        _isObsure = !_isObsure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
