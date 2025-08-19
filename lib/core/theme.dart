import 'package:flutter/material.dart';

/// Configuration du thème global de l'application "L'Envol du Phénix"
/// 
/// Définit un thème sombre avec une palette de couleurs violettes
/// pour créer une ambiance mystique en accord avec le nom de l'application.
/// 
/// Couleurs principales :
/// - Primary: Violet profond (#6A0DAD)
/// - Background: Noir foncé (#121212)
/// - Cards: Gris foncé (#1E1E1E)
ThemeData buildTheme() {
  // Palette de couleurs personnalisée
  const primary = Color(0xFF6A0DAD); // Violet profond pour les éléments principaux
  const bg = Color(0xFF121212);      // Arrière-plan noir foncé
  const card = Color(0xFF1E1E1E);    // Couleur des cartes et surfaces

  return ThemeData(
    // Schéma de couleurs basé sur Material Design 3
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark, // Mode sombre
    ),
    
    // Couleurs spécifiques des composants
    scaffoldBackgroundColor: bg,
    cardColor: card,
    
    // Activation de Material Design 3
    useMaterial3: true,
    
    // Personnalisation de la typographie
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.w700), // Titres en gras
    ),
  );
}
