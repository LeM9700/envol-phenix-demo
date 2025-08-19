/// Tests de widgets pour l'application "L'Envol du Phénix"
/// 
/// Ces tests vérifient le bon fonctionnement de l'interface utilisateur
/// en simulant les interactions utilisateur et en validant l'affichage
/// des éléments attendus.
///
/// Utilise les outils de test Flutter :
/// - WidgetTester pour les interactions (tap, scroll, etc.)
/// - Matchers pour vérifier la présence d'éléments UI
/// - pumpWidget pour construire l'arbre de widgets

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:phenix_demo/app.dart';

void main() {
  /// Test principal : vérification du chargement de l'application
  /// 
  /// Valide que l'écran d'accueil s'affiche correctement avec :
  /// - Le titre "L'Envol du Phénix"
  /// - Le bouton "+ Commencer"
  /// - L'icône de lecture (play_arrow)
  testWidgets('App loads correctly', (WidgetTester tester) async {
    // Construction de l'application avec ProviderScope pour Riverpod
    await tester.pumpWidget(const ProviderScope(child: PhenixApp()));

    // Attendre que tous les widgets se stabilisent (animations, async, etc.)
    await tester.pumpAndSettle();

    // Vérifications : présence des éléments attendus sur l'écran d'accueil
    expect(find.text('L\'Envol du Phénix'), findsOneWidget);
    expect(find.text('+ Commencer'), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
  });
}
