import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../home/widgets/start_button.dart';

/// Écran d'accueil de l'application "L'Envol du Phénix"
/// 
/// Premier écran visible par l'utilisateur, il présente :
/// - Le titre de l'application
/// - Une description courte de la démo
/// - Un bouton pour démarrer le jeu
/// 
/// Respecte les spécifications du client : écran d'accueil simple
/// avec titre et bouton "Commencer" pour naviguer vers le jeu.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Titre principal de l'application
              const Text(
                'L\'Envol du Phénix',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 12),
              
              // Description de la démo
              const Text(
                'Micro-démo : grille 3×3, pion, offline asset',
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // Bouton pour démarrer le jeu - navigation vers '/game'
              StartButton(
                onPressed: () => context.pushNamed('game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
