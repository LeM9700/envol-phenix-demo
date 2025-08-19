import 'package:flutter/material.dart';

/// Palette de couleurs centralisée de l'application "L'Envol du Phénix"
/// 
/// Définit toutes les couleurs utilisées dans l'application pour maintenir
/// une cohérence visuelle et faciliter les modifications de design.
/// 
/// Thème : Ambiance mystique avec des tons violets et sombres
class AppColors {
  /// Couleur principale - Violet profond
  /// Utilisée pour les boutons principaux et les éléments d'action
  static const primary = Color(0xFF6A0DAD);
  
  /// Couleur d'arrière-plan principal - Noir bleuté très foncé
  /// Utilisée pour les fonds d'écran et les zones principales
  static const background = Color(0xFF101014);
  
  /// Couleur des surfaces - Gris foncé légèrement bleuté
  /// Utilisée pour les cartes, boutons secondaires et surfaces élevées
  static const surface = Color(0xFF17171C);
  
  /// Couleur des lignes de grille - Gris moyen
  /// Utilisée pour dessiner les lignes de la grille 3x3
  static const gridLine = Color(0xFF2A2A33);
  
  /// Couleur d'accent - Violet clair
  /// Utilisée pour le pion et les éléments qui doivent ressortir
  static const accent = Color(0xFFE0B3FF);
}
