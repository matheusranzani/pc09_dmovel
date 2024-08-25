import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/score_model.dart';
import '../widgets/score_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScoreModel _scoreModel = ScoreModel();

  void _addScore(int team, int points) {
    setState(() {
      _scoreModel.addScore(team, points);
    });
  }

  void _undoScore() {
    setState(() {
      _scoreModel.undoLastScore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(loc.team1, style: Theme.of(context).textTheme.headlineSmall),
                    Text('${_scoreModel.team1Score}', style: Theme.of(context).textTheme.headlineMedium),
                    ScoreButton(label: loc.freeThrow, onPressed: () => _addScore(1, 1)),
                    ScoreButton(label: loc.twoPoints, onPressed: () => _addScore(1, 2)),
                    ScoreButton(label: loc.threePoints, onPressed: () => _addScore(1, 3)),
                  ],
                ),
                Column(
                  children: [
                    Text(loc.team2, style: Theme.of(context).textTheme.headlineSmall),
                    Text('${_scoreModel.team2Score}', style: Theme.of(context).textTheme.headlineMedium),
                    ScoreButton(label: loc.freeThrow, onPressed: () => _addScore(2, 1)),
                    ScoreButton(label: loc.twoPoints, onPressed: () => _addScore(2, 2)),
                    ScoreButton(label: loc.threePoints, onPressed: () => _addScore(2, 3)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scoreModel.lastAction == 0 ? null : _undoScore,
              child: Text(loc.undo),
            ),
          ],
        ),
      ),
    );
  }
}