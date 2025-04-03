import 'package:chic_lyne/features/fliter_view/data/apis/sort_by_api_service.dart';
import 'package:chic_lyne/features/fliter_view/data/models/result_model.dart';

class SortByRepo {
  
  final SortByApiService sortByApiService;

  SortByRepo( this.sortByApiService);

  Future<ResultSortByModel> getSortBy(String sortBy, String order) async {
    return await sortByApiService.getSortBy(sortBy, order);
  }
}
