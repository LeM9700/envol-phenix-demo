# L'Envol du Phénix - Document Explicatif

## Présentation du Projet

**L'Envol du Phénix** est une mini-application mobile cross-platform développée en Flutter qui démontre la gestion d'un pion sur une grille 3×3 avec un système de score.

---

## Choix Techniques

### 1. **Framework : Flutter**
- **Pourquoi Flutter ?**
  - Cross-platform natif (Android + iOS avec un seul code source)
  - Performance optimisée pour smartphones entrée/milieu de gamme
  - Rendu fluide et réactif
  - Poids minimal des applications générées
  - Fonctionnement hors ligne par défaut

### 2. **Gestion d'État : Riverpod**
- **Avantages :**
  - Gestion d'état réactive et performante
  - Architecture claire et maintenable
  - Rebuild optimisé des widgets (seuls les widgets nécessaires se mettent à jour)
  - Facilite les tests unitaires
  - Évite les rebuilds inutiles

### 3. **Rendu de la Grille : CustomPainter**
- **Pourquoi CustomPainter ?**
  - Performance optimale pour le dessin de formes géométriques
  - Contrôle total sur le rendu (grille, pion, texte)
  - Extensible pour ajouter de nouveaux éléments visuels
  - Légèreté (pas de widgets lourds)

### 4. **Architecture Clean Architecture**
```
lib/
├── config/           # Configuration (couleurs, assets, constantes)
├── core/            # Router et thème global
├── features/        # Fonctionnalités métier
│   ├── game/
│   │   ├── data/models/      # Modèles de données
│   │   ├── logic/           # Logique métier (GameController)
│   │   └── presentation/    # Interface utilisateur
│   └── home/        # Écran d'accueil
└── app.dart         # Point d'entrée principal
```

---

## Fonctionnalités Implémentées

### ✅ **Écran d'Accueil**
- Titre : "L'Envol du Phénix"
- Bouton "Commencer" pour naviguer vers le jeu

### ✅ **Écran de Jeu**
- **Grille 3×3** avec image d'arrière-plan intégrée
- **Pion** positionné sur une case (dessiné avec CustomPainter)
- **Boutons directionnels** (↑, ↓, ←, →) pour déplacer le pion
- **Système de score** : +1 point par déplacement
- **Case de départ** identifiée par le texte "départ"
- **Bouton Reset** pour réinitialiser la grille et le score
- **Image d'arrière-plan** visible même hors ligne

### ✅ **Contraintes Respectées**
- ✅ Fonctionne sans connexion internet
- ✅ Optimisé pour smartphones entrée/milieu de gamme
- ✅ Application légère (poids minimal)
- ✅ Navigation fluide et réactive

---

## Architecture Extensible

### 🚀 **Comment Ajouter Plus de Cases**
```dart
// Dans app_constants.dart
class AppConstants {
  static const int defaultGridSize = 5; // Changer de 3 à 5 pour une grille 5×5
}
```

### 🚀 **Comment Ajouter des Obstacles**
```dart
// Dans GameState, ajouter :
final List<Position> obstacles;

// Dans GridPainter, ajouter le rendu des obstacles :
void _drawObstacles(Canvas canvas, Size size) {
  for (final obstacle in obstacles) {
    final center = Offset(
      (obstacle.col + 0.5) * cellW,
      (obstacle.row + 0.5) * cellH,
    );
    final obstaclePaint = Paint()..color = Colors.red;
    canvas.drawRect(
      Rect.fromCenter(center: center, width: cellW * 0.8, height: cellH * 0.8),
      obstaclePaint,
    );
  }
}
```

### 🚀 **Comment Ajouter des Niveaux**
```dart
// Nouveau modèle Level
class Level {
  final int gridSize;
  final List<Position> obstacles;
  final Position startPosition;
  final int targetScore;
}

// Dans GameController, ajouter :
void loadLevel(Level level) {
  state = state.copyWith(
    gridSize: level.gridSize,
    obstacles: level.obstacles,
    pawn: level.startPosition,
  );
}
```

### 🚀 **Comment Ajouter des Animations**
```dart
// Utiliser AnimationController pour animer les déplacements :
class AnimatedGameScreen extends StatefulWidget {
  // Implémenter des transitions fluides entre les positions
}
```

---

## Instructions d'Exécution

### 📱 **Prérequis**
- Flutter SDK (≥ 3.0.0)
- Android Studio ou VS Code avec extensions Flutter
- Émulateur Android ou appareil physique connecté

### 🛠 **Installation et Exécution**
```bash
# Cloner le projet
git clone <url_du_repository>
cd phenix_demo

# Installer les dépendances
flutter pub get

# Lancer en mode debug
flutter run

# Générer l'APK de production
flutter build apk --release
```

### 📦 **Génération APK**
```bash
# APK de production optimisé
flutter build apk --release --target-platform android-arm64

# L'APK sera généré dans :
# build/app/outputs/flutter-apk/app-release.apk
```

---

## Tests

### 🧪 **Tests Unitaires**
```bash
flutter test
```

### 🧪 **Tests d'Intégration**
Le projet inclut des tests pour vérifier :
- Le chargement correct de l'application
- La navigation entre les écrans
- La présence des éléments UI essentiels

---

## Performance et Optimisation

### ⚡ **Optimisations Implémentées**
- **CustomPainter** pour un rendu efficace de la grille
- **Riverpod** pour des rebuilds optimisés
- **Image.asset** avec mise en cache automatique
- **ConstrainedBox** pour adapter l'interface à différentes tailles d'écran

### 📱 **Compatibilité**
- Android 5.0+ (API 21+)
- iOS 11.0+
- Testé sur smartphones entrée/milieu de gamme

---

## Conclusion

Ce projet démontre une architecture Flutter solide et extensible, parfaite pour évoluer vers un jeu plus complexe. L'utilisation de Riverpod et CustomPainter garantit des performances optimales tout en conservant une base de code maintenable.

---

**Développé pour L'Envol du Phénix**  
**Date :** Août 2025  
**Technologies :** Flutter, Riverpod, Dart
