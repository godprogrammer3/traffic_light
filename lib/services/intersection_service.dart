import 'package:injectable/injectable.dart';
import 'package:traffic_light/datamodel/intersection.dart';

@lazySingleton
class IntersectionService {
  List<Intersection> _intersections;
  List<Intersection> get intersections => _intersections;
  Future<Intersection> getIntersectionsForUser(String uid) {}
}
