import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';

final postControllerProvider =
    Provider((ref) => PostData(ref, ref.read(dioClientProvider)));

class PostData {
  final Ref ref;
  final DioClient _dioClient;
  PostData(this.ref, this._dioClient);

  Future addNewListing(newListing) async {
    print(newListing);
    try {
      final res = await _dioClient.post(
          'http://viwahaweb.nikhilaholdings.lk/api/listings/add_listing',
          data: newListing);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
