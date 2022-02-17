class Pagination {
  int? count;
  int? page;
  int? size;
  int? total;

  Pagination({this.count, this.page, this.size, this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json['count'] as int?,
        page: json['page'] as int?,
        size: json['size'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'page': page,
        'size': size,
        'total': total,
      };
}
