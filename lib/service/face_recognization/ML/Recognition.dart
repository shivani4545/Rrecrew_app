import 'dart:ui';

class Recognition {
  String id;
  String name;
  Rect location;
  List<double> embeddings;
  double distance;
  /// Constructs a Category.
  Recognition(this.id, this.name, this.location,this.embeddings,this.distance);

}
