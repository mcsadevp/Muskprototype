import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apps Salo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black, Colors.black45],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'BIENVENIDO',
                style: TextStyle(
                  fontFamily: 'roboto',
                  color: Colors.blueGrey,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QRScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 75, vertical: 15),
                    elevation: 25,
                    shape: RoundedRectangleBorder(
                      // Usa RoundedRectangleBorder para el radio del borde
                      borderRadius: BorderRadius.circular(
                          15.0), // Ajusta la redondez de las esquinas
                    ),
                  ),
                  child: const Text(
                    'Escanear QR',
                    style: TextStyle(
                      fontFamily:
                          'Roboto', // Reemplaza con la familia de la fuente que deseas
                      fontSize: 22,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthOptionsScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 72, vertical: 15),
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                        // Usa RoundedRectangleBorder para el radio del borde
                        borderRadius: BorderRadius.circular(
                            15.0), // Ajusta la redondez de las esquinas
                      ),
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontFamily:
                            'Roboto', // Reemplaza con la familia de la fuente que deseas
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? _barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      backgroundColor: const Color.fromARGB(115, 31, 45, 59),
      body: Center(
        child: Stack(
          children: [
            QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
            Center(
              child: Container(
                width: 225, // Ancho del marco
                height: 225, // Altura del marco
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white, // Color del borde del marco
                    width: 4, // Grosor del borde del marco
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 55, // Espacio desde abajo
              child: Container(
                padding: const EdgeInsets.all(42),
                color: Colors.grey.withOpacity(0.8), // Fondo gris con opacidad
                child: const Text(
                  'Escanee el QR de su llave...',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        _barcode = barcode;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

void any() {
  runApp(const MaterialApp(
    home: QRScreen(),
  ));
}

class AuthOptionsScreen extends StatelessWidget {
  const AuthOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones de Autenticación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Lógica para autenticación por patrón
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                elevation: 20,
              ),
              child: const Text('Patrón'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para autenticación por PIN
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                elevation: 20,
              ),
              child: const Text('PIN'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para autenticación por huella digital
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                elevation: 20,
              ),
              child: const Text('Huella'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para autenticación por contraseña
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                elevation: 20,
              ),
              child: const Text('Contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}
