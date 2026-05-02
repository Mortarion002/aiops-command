import '../../../features/insights/models/insight_item_model.dart';

abstract class IInsightsRepository {
  Future<List<InsightItem>> getInsights();
}
