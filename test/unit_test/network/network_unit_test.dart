// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;
// import 'package:show_off/repository/network/network.dart';
//
// class MockNetwork extends Mock implements http.Client{}
//
// main(){
//   group('fetchData', () {
//     test('returns a Post if the http call completes successfully', () async {
//       final client = MockNetwork();
//
//       // Use Mockito to return a successful response when it calls the
//       // provided http.Client.
//       when(client.get(Network.url))
//           .thenAnswer((_) async => http.Response('['
//           '{"id":"1","name":"Miss Libbie Huel","avatar_url":"https://s3.amazonaws.com/uifaces/faces/twitter/souuf/128.jpg","address":"Suite 307"},'
//           '{"id":"2","name":"Mr. Alvis Lynch","avatar_url":"https://s3.amazonaws.com/uifaces/faces/twitter/sangdth/128.jpg","address":"Suite 904"}'
//           ']', 200));
//     });
//   });
// }