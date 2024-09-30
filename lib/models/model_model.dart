class ModelModel {
  ModelModel({
    required this.name,
    required this.digest,
  });
  final String name;
  final String digest;

  factory ModelModel.fromMap(Map<String, dynamic> map) {
    return ModelModel(
      name: map['name'], // Assumindo que o JSON tem a chave 'name'
      digest: map['digest'], // Assumindo que o JSON tem a chave 'digest'
    );
  }
}
