class ScoreModel {
  int team1Score;
  int team2Score;
  int lastAction; // 1: Team 1, -1: Team 2
  int lastScore;

  ScoreModel({
    this.team1Score = 0,
    this.team2Score = 0,
    this.lastAction = 0,
    this.lastScore = 0,
  });

  void addScore(int team, int points) {
    if (team == 1) {
      team1Score += points;
      lastAction = 1;
    } else if (team == 2) {
      team2Score += points;
      lastAction = -1;
    }

    lastScore = points;
  }

  void undoLastScore() {
    if (lastAction == 1) {
      team1Score -= lastScore;
    } else if (lastAction == -1) {
      team2Score -= lastScore;
    }

    lastAction = 0;
  }
}