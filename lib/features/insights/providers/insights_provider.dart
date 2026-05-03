import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/repositories/interfaces/i_insights_repository.dart';
import '../../../data/repositories/mock/mock_insights_repository.dart';
import '../models/insight_item_model.dart';

part 'insights_provider.g.dart';

@riverpod
IInsightsRepository insightsRepository(Ref ref) => MockInsightsRepository();

@riverpod
Future<List<InsightItem>> insightsData(Ref ref) {
  return ref.watch(insightsRepositoryProvider).getInsights();
}
