# 🔥 L'Envol du Phénix - Démo

> **Mini-application mobile démontrant la gestion d'un pion sur une grille 3×3**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

---

## 📱 Aperçu

**L'Envol du Phénix** est une application Flutter cross-platform qui présente :
- 🏠 **Écran d'accueil** avec navigation fluide
- 🎮 **Écran de jeu** avec grille 3×3 interactive
- 🎯 **Système de déplacement** du pion avec boutons directionnels
- 📊 **Système de score** (+1 par déplacement)
- 🖼️ **Image d'arrière-plan** intégrée (fonctionne hors ligne)
- 🔄 **Fonction Reset** pour recommencer

---

## 🚀 Démarrage Rapide

### Prérequis
- **Flutter SDK** ≥ 3.0.0
- **Android Studio** ou **VS Code** avec extensions Flutter
- **Émulateur Android** ou **appareil physique** connecté

### Installation
```bash
# 1. Cloner le repository
git clone <url_du_repository>
cd phenix_demo

# 2. Installer les dépendances
flutter pub get

# 3. Vérifier l'installation
flutter doctor

# 4. Lancer l'application
flutter run
```

---

## 🏗️ Architecture

```
lib/
├── 📁 config/              # Configuration globale
│   ├── app_assets.dart     # Chemins des assets
│   ├── app_colors.dart     # Palette de couleurs
│   └── app_constants.dart  # Constantes de l'app
├── 📁 core/                # Architecture de base
│   ├── router.dart         # Navigation (GoRouter)
│   └── theme.dart          # Thème global
├── 📁 features/            # Fonctionnalités métier
│   ├── 📁 game/           # Logique de jeu
│   │   ├── 📁 data/models/     # Modèles (Position)
│   │   ├── 📁 logic/          # GameController (Riverpod)
│   │   └── 📁 presentation/   # GameScreen, GridWidget
│   └── 📁 home/           # Écran d'accueil
│       ├── 📁 presentation/   # HomeScreen
│       └── 📁 widgets/        # StartButton
├── app.dart                # App principale
└── main.dart              # Point d'entrée
```

---

## 🎮 Fonctionnalités

### ✅ Écran d'Accueil
- Titre : **"L'Envol du Phénix"**
- Bouton **"+ Commencer"** vers le jeu

### ✅ Écran de Jeu
- **Grille 3×3** avec image d'arrière-plan
- **Pion** déplaçable avec 4 boutons directionnels (↑↓←→)
- **Score** qui s'incrémente à chaque déplacement
- **Case "départ"** identifiée visuellement
- **Bouton Reset** pour recommencer

### ✅ Contraintes Respectées
- 🌐 **Fonctionne hors ligne** (assets intégrés)
- 📱 **Optimisé** pour smartphones entrée/milieu de gamme
- ⚡ **Navigation fluide** et réactive
- 🪶 **Application légère** (APK optimisé)

---

## 🛠️ Technologies Utilisées

| Technologie | Usage | Avantage |
|-------------|-------|----------|
| **Flutter** | Framework cross-platform | Performance native, un seul code source |
| **Riverpod** | Gestion d'état | Réactivité, performance, maintenabilité |
| **CustomPainter** | Rendu de la grille | Performance optimale, contrôle total |
| **GoRouter** | Navigation | Navigation déclarative moderne |

---

## 📦 Build Production

### Générer l'APK
```bash
# APK de production optimisé
flutter build apk --release

# APK se trouve dans :
# build/app/outputs/flutter-apk/app-release.apk
```

### Générer l'App Bundle (Google Play)
```bash
# App Bundle pour le Play Store
flutter build appbundle --release

# AAB se trouve dans :
# build/app/outputs/bundle/release/app-release.aab
```

---

## 🧪 Tests

```bash
# Lancer tous les tests
flutter test

# Tests avec couverture
flutter test --coverage

# Analyser le code
flutter analyze
```

---

## 🚀 Extensibilité Future

### Grille Plus Grande
```dart
// Dans app_constants.dart
static const int defaultGridSize = 5; // Au lieu de 3
```

### Ajouter des Obstacles
- Nouveau modèle `Obstacle`
- Logique de collision dans `GameController`
- Rendu dans `GridPainter`

### Système de Niveaux
- Modèle `Level` avec objectifs
- Progression sauvegardée
- Interface de sélection de niveaux

---

## 📱 Compatibilité

- **Android** : 5.0+ (API 21+)
- **iOS** : 11.0+
- **Taille APK** : ~10-15 MB
- **RAM minimum** : 2 GB

---

## 👥 Contribution

1. **Fork** le projet
2. **Créer** une branche feature (`git checkout -b feature/nouvelle-fonctionnalite`)
3. **Commit** les changements (`git commit -am 'Ajouter nouvelle fonctionnalité'`)
4. **Push** vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. **Créer** une Pull Request

---

## 📄 Licence

Ce projet est développé pour **L'Envol du Phénix** dans le cadre d'une mission de développement.

---



## 🔗 Liens Utiles

- [Documentation Flutter](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Dart Language](https://dart.dev/)

---

**Fait avec ❤️ et Flutter**
