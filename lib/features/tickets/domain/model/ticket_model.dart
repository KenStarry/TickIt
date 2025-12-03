class TicketModel {
  final String ticketId;
  final String ticketUserId;
  final String ticketTitle;
  final String ticketBody;

  const TicketModel({
    required this.ticketId,
    required this.ticketUserId,
    required this.ticketTitle,
    required this.ticketBody,
  });

  TicketModel copyWith({
    String? ticketId,
    String? ticketUserId,
    String? ticketTitle,
    String? ticketBody,
  }) {
    return TicketModel(
      ticketId: ticketId ?? this.ticketId,
      ticketUserId: ticketUserId ?? this.ticketUserId,
      ticketTitle: ticketTitle ?? this.ticketTitle,
      ticketBody: ticketBody ?? this.ticketBody,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticketId': ticketId,
      'ticketTitle': ticketTitle,
      'ticketUserId': ticketUserId,
      'ticketBody': ticketBody,
    };
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      ticketId: json['ticketId'] as String? ?? '',
      ticketTitle: json['ticketTitle'] as String? ?? 'Untitled ticket',
      ticketBody: json['ticketBody'] as String? ?? '',
      ticketUserId: json['ticketUserId'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return 'ticketModel(ticketId: $ticketId, ticketTitle: $ticketTitle, ticketBody: $ticketBody, ticketUserId: $ticketUserId)';
  }
}
