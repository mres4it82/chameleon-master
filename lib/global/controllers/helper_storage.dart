import 'package:get_storage/get_storage.dart';

class DataStorage {
  final GetStorage _storage;

  DataStorage() : _storage = GetStorage();

  /// Get the companyId and branchId from the stored user data
  Map<String, dynamic>? getCompanyAndBranch() {
    try {
      final userData = _storage.read('user'); // قراءة بيانات المستخدم
      if (userData != null && userData['data'] != null) {
        final companyId = userData['data']['companyId'];
        final branchId = userData['data']['branchId'];
        return {'companyId': companyId, 'branchId': branchId};
      }
    } catch (e) {
      print('Error retrieving user data: $e');
    }
    return null; // إذا لم توجد بيانات أو حدث خطأ
  }
}
