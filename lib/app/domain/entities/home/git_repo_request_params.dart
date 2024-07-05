class GitRepoRequestModel {
  final String query;
  final String sort;
  final String order;

  GitRepoRequestModel({
    required this.query,
    required this.sort,
    required this.order,
  });

  GitRepoRequestModel copyWith({
    String? query,
    String? sort,
    String? order,
  }) =>
      GitRepoRequestModel(
        query: query ?? this.query,
        sort: sort ?? this.sort,
        order: order ?? this.order,
      );

  factory GitRepoRequestModel.fromJson(Map<String, dynamic> json) =>
      GitRepoRequestModel(
        query: json["q"],
        sort: json["sort"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "q": query,
        "sort": sort,
        "order": order,
      };

  String toPassInRequest() {
    final dataArray = [];
    if (query.isNotEmpty) {
      dataArray.add("q=$query");
    }
    if (sort.isNotEmpty) {
      dataArray.add("sort=$sort");
    }
    if (order.isNotEmpty) {
      dataArray.add("order=$order");
    }
    return dataArray.join("&");
  }
}
