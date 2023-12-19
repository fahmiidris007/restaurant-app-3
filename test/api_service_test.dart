import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant.dart';
import 'package:restaurant_app/data/model/list_restaurant.dart';
import 'package:restaurant_app/data/model/review_restaurant.dart';
import 'package:restaurant_app/data/model/search_restaurant.dart';
import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group(
    'Restaurant API test, parsing json',
    () {
      test(
        'return list restaurant',
        () async {
          final mockClient = MockClient();
          when(
            mockClient.get(
              Uri.parse('https://restaurant-api.dicoding.dev/list'),
            ),
          ).thenAnswer(
            (_) async => http.Response(
                '{"error":false,"message":'
                '"success","count":20,"restaurants":[]}',
                200),
          );

          expect(
            await ApiService(client: mockClient).listRestaurant(),
            isA<ListRestaurant>(),
          );
        },
      );

      test(
        'return detail restaurant',
        () async {
          final mockClient = MockClient();
          when(
            mockClient.get(
              Uri.parse('https://restaurant-api.dicoding.dev/'
                  'detail/rqdv5juczeskfw1e867'),
            ),
          ).thenAnswer(
            (_) async => http.Response(
                '{"error":false,"message":"success","restaurant":'
                '{"id":"rqdv5juczeskfw1e867","name":"Test Restaurant",'
                '"description":"Test Description","city":"Test City",'
                '"address":"Test Address","pictureId":"Test Picture",'
                '"categories":[],"menus":{"foods":[],"drinks":[]},'
                '"rating":4.2,"customerReviews":[]}}',
                200),
          );
          expect(
            await ApiService(client: mockClient)
                .detailRestaurant("rqdv5juczeskfw1e867"),
            isA<DetailRestaurant>(),
          );
        },
      );

      test(
        'return search restaurant',
        () async {
          final mockClient = MockClient();
          when(
            mockClient.get(
              Uri.parse('https://restaurant-api.dicoding.dev/search?q=Test'),
            ),
          ).thenAnswer(
            (_) async => http.Response(
                '{"error":false,"founded":20,"restaurants":[]}',
                200),
          );
          expect(
            await ApiService(client: mockClient).searchRestaurant("Test"),
            isA<SearchRestaurant>(),
          );
        },
      );

      test(
        'return review restaurant',
        () async {
          final mockClient = MockClient();
          when(
            mockClient.post(
              Uri.parse('https://restaurant-api.dicoding.dev/review'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'X-Auth-Token': '12345',
              },
              body: jsonEncode(
                <String, String>{
                  'id': 'rqdv5juczeskfw1e867',
                  'name': 'Test Name',
                  'review': 'Test Review',
                },
              ),
            ),
          ).thenAnswer(
            (_) async => http.Response(
                '{"error":false,"message":"success","customerReviews":[]}',
                200),
          );
          expect(
            await ApiService(client: mockClient).postReviewRestaurant(
              'rqdv5juczeskfw1e867',
              'Test Name',
              'Test Review',
            ),
            isA<ReviewRestaurant>(),
          );
        },
      );
    },
  );
}
