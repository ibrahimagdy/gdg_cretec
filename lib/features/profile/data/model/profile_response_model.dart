class ProfileResponseModel {
  final Model model;
  final int statusCode;

  ProfileResponseModel({required this.model, required this.statusCode});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        model: Model.fromJson(json['model']),
        statusCode: json['statusCode'],
      );
}

class Model {
  final String id;
  final String? profilePicture;
  final String userName;
  final String email;

  Model({
    required this.id,
    this.profilePicture,
    required this.userName,
    required this.email,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json['id'],
        userName: json['userName'],
        email: json['email'],
      );
}
