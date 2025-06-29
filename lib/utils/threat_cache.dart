import 'package:shared_preferences/shared_preferences.dart';

class ThreatCache {
  static const _scoreKey = 'threat_score';
  static const _timeKey = 'threat_time';

  static Future<void> save(double score, int epochMillis) async {
    final p = await SharedPreferences.getInstance();
    await p.setDouble(_scoreKey, score);
    await p.setInt(_timeKey, epochMillis);
  }

  /// returns (score, epochMillis) or (null, null) if not set
  static Future<(double?, int?)> load() async {
    final p = await SharedPreferences.getInstance();
    return (p.getDouble(_scoreKey), p.getInt(_timeKey));
  }
}
