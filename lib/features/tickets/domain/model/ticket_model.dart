class TicketModel {
  final String? ticketId;
  final String? ticketUserId;
  final String? ticketCategoryId;
  final String? ticketTitle;
  final String? ticketBody;
  final bool ticketResolved;
  final String? ticketUserAvatarUrl;

  const TicketModel({
    this.ticketId,
    this.ticketUserId,
    this.ticketCategoryId,
    this.ticketTitle,
    this.ticketBody,
    this.ticketResolved = false,
    this.ticketUserAvatarUrl,
  });

  TicketModel copyWith({
    String? ticketId,
    String? ticketUserId,
    String? ticketCategoryId,
    String? ticketTitle,
    String? ticketBody,
    bool? ticketResolved,
    String? ticketUserAvatarUrl,
  }) {
    return TicketModel(
      ticketId: ticketId ?? this.ticketId,
      ticketUserId: ticketUserId ?? this.ticketUserId,
      ticketCategoryId: ticketCategoryId ?? this.ticketCategoryId,
      ticketTitle: ticketTitle ?? this.ticketTitle,
      ticketBody: ticketBody ?? this.ticketBody,
      ticketResolved: ticketResolved ?? this.ticketResolved,
      ticketUserAvatarUrl: ticketUserAvatarUrl ?? this.ticketUserAvatarUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': int.tryParse(ticketId ?? '0'),
      'title': ticketTitle,
      'userId': int.tryParse(ticketUserId ?? '0'),
      'body': ticketBody,
    };
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      ticketId: json['id'].toString() as String? ?? '',
      ticketTitle: json['title'] as String? ?? 'Untitled ticket',
      ticketBody: json['body'] as String? ?? '',
      ticketUserId: json['userId'].toString() as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'ticketModel(ticketId: $ticketId, ticketTitle: $ticketTitle, ticketBody: $ticketBody, ticketUserId: $ticketUserId)';
  }
}
