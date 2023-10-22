
class LikeDto {
  final int id;
  final CustomerDto customer;
  final int articleId;

  LikeDto({
    required this.id,
    required this.customer,
    required this.articleId,
  });

  LikeDto.fromView(LikeView like)
      : id = like.id,
        customer = CustomerDto.fromView(like.customer),
        articleId = like.articleId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer.toJson(),
      'articleId': articleId,
    };
  }

  factory LikeDto.fromJson(Map<String, dynamic>? json) {
    return LikeDto(
      id: json?['id'],
      customer: CustomerDto.fromJson(json?['customer']),
      articleId: json?['articleId'],
    );
  }
}
