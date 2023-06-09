class Liverpool {
  late String id;
  late String logo1;
  late String logo2;
  late String schedule;
  late String score1;
  late String score2;
  late String team1;
  late String team2;
  late String venue;
  Liverpool(this.id, this.logo1, this.logo2, this.schedule, this.score1,
      this.score2, this.team1, this.team2, this.venue);
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "logo1": logo1,
      "logo2": logo2,
      "schedule": schedule,
      "score1": score1,
      "score2": score2,
      "team1": team1,
      "team2": team2,
      "venue": venue,
    };
  }

  Liverpool.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    logo1 = map["logo1"];
    logo2 = map["logo2"];
    schedule = map["schedule"];
    score1 = map["score1"];
    score2 = map["score2"];
    team1 = map["team1"];
    team2 = map["team2"];
    venue = map["venue"];
  }
}
