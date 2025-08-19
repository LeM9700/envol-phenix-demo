import 'package:flutter/material.dart';

/// Widget bouton personnalisé pour démarrer une partie
/// 
/// Bouton principal de l'écran d'accueil qui permet à l'utilisateur
/// de naviguer vers l'écran de jeu. Utilise le design Material avec :
/// - Une icône de lecture (play_arrow)
/// - Le texte "Commencer" comme demandé dans les spécifications
/// - Un padding généreux pour une bonne accessibilité tactile
class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.onPressed});
  
  /// Callback appelé lors de l'appui sur le bouton
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.play_arrow), // Icône de lecture universelle
      label: const Text('+ Commencer'), // Texte conforme aux spécifications
      style: ElevatedButton.styleFrom(
        // Padding généreux pour une meilleure expérience tactile
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }
}
