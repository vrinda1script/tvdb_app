import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tvdb_app/models/movies_list_model.dart';
import 'package:http/http.dart' as http;

class DashBoardController with ChangeNotifier {
  DashBoardController() {
    fetchUsers();
  }

  // final ApiClient _apiService = ApiClient();
  List<MoviesList> moviesListDataResponse = <MoviesList>[];
  // Future<void> _getMoviesListData() async {
  //   final response = await _apiService.getMovieList();

  //   if (response != null) {
  //     final commonResponse = CommonApiResponse.fromJson(
  //       response.data,
  //     );
  //     if (commonResponse.status ?? false) {
  //       final moviesListResponse = MoviesListResponseModel.fromJson(
  //         response.data,
  //       );
  //       moviesListDataResponse = moviesListResponse.data ?? [];
  //     } else {
  //       // customSnackBar(
  //       //     errorType: AppErrors.errorOccurred,
  //       //     errorMessage: commonResponse.msg ?? AppErrors.unknownErrorDetails);
  //     }
  //   }
  // }

  Future<void> fetchUsers() async {
    const String url = 'https://api4.thetvdb.com/v4/movies';
    const String token =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZ2UiOiIiLCJhcGlrZXkiOiI1ODBjOTIzOS1kMmY4LTQ0NjAtYTIyZS02ODMxOTAwYTk3YTMiLCJjb21tdW5pdHlfc3VwcG9ydGVkIjp0cnVlLCJleHAiOjE3MjA3NDU4NTYsImdlbmRlciI6IiIsImhpdHNfcGVyX2RheSI6MTAwMDAwMDAwLCJoaXRzX3Blcl9tb250aCI6MTAwMDAwMDAwLCJpZCI6IjEiLCJpc19tb2QiOnRydWUsImlzX3N5c3RlbV9rZXkiOmZhbHNlLCJpc190cnVzdGVkIjpmYWxzZSwicGluIjoiSVBRWk9DTU4iLCJyb2xlcyI6WyJNb2QiXSwidGVuYW50IjoidHZkYiIsInV1aWQiOiIifQ.TBIVzBxwewR3WJ1-ZYwr_nX99ZkJ_r024WRIKbkrZAJ0hK_HQSQR5dZBPXxnrhmgyqvo_-XYxioNwjH_TF0OOXiTEL7YwjoUZsDXYUQTD9qI91qqbscd3v0TG_QhUJ3ZTvoa-dx3dfBfyQcssLMq_WZ4eKXlL0MYcICe-AFtZ6pKqMN-Rhtrlm5EjDDDVgETuhwRVKeCAXMcn7s0CTBAQucJh2gCSKZ9IgbxM-zq26Rf-ReGsSs5u2qioHSMB_d4ER1pGRIMjC4Y_x1s7wMBRrZqRYmby7BGpbyoJCTsDSuIaAPkqnY5VgNbAYyxc2L3fVRMnjQe4Si0CsIHR69o7sASIOcEI9uX1t45bvuGRx41aZaJIR-TIBilyppPfMQJivfg9hnKI4V1Uh2Zn62SDs-PQIGsvbDilLvi2N7CsrgYLmdX8TJftin3HMwePnqyG90MaSPVZCM_RJHclBZg14WhgiWScK2fB08YnCcp0RnQP79wWteGVE8zzKJ6bTxthA2We45rzIHvT1m5RzgILpK4w4_qp012RpBRpaH8BYY2iUm8CCARY_dgAvdw27ddZMZUuKhY5B-cm4S3nWztZtDMGVHzhwgvfr8WAsxb2gnYEKGqvR5506lgJgc1RBMovTlG4FS0BtUrfsoqprAxiqhHvYfrkSRAL89AypGYD5M';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final commonResponse =
          MoviesListResponseModel.fromJson(json.decode(response.body));
      moviesListDataResponse = commonResponse.data ?? [];
      debugPrint('---------$commonResponse');
    }
    notifyListeners();
    //   if (response.statusCode == 200) {
    //     List<dynamic> jsonResponse = json.decode(response.body);
    //     return jsonResponse.map((moviesListDataResponse) => MoviesListResponseModel.fromJson(user)).toList();
    //     final moviesListResponse = MoviesListResponseModel.fromJson(
    //       response.data,
    //     );
    //     moviesListDataResponse = moviesListResponse.data ?? [];
    //   } else {
    //     // If the server did not return a 200 OK response, throw an exception.
    //     throw Exception('Failed to load users');
    //   }
    // }
  }
}
