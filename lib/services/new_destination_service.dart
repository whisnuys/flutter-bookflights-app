import 'package:bookflights/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewDestinationService {
  CollectionReference _newDestinationRef =
      FirebaseFirestore.instance.collection('newdestinations');

  Future<List<DestinationModel>> fetchNewDestinations() async {
    try {
      QuerySnapshot result = await _newDestinationRef.get();

      List<DestinationModel> newDestinations = result.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return newDestinations;
    } catch (e) {
      rethrow;
    }
  }
}
