class TicketModel {
  final String ticketId;
  final String ticketTitle;
  final String ticketCoverUrl;
  final int ticketAmount;

  const TicketModel({
    required this.ticketId,
    required this.ticketTitle,
    required this.ticketCoverUrl,
    required this.ticketAmount,
  });

  TicketModel copyWith({
    String? ticketId,
    String? ticketTitle,
    String? ticketCoverUrl,
    int? ticketAmount,
  }) {
    return TicketModel(
      ticketId: ticketId ?? this.ticketId,
      ticketTitle: ticketTitle ?? this.ticketTitle,
      ticketCoverUrl: ticketCoverUrl ?? this.ticketCoverUrl,
      ticketAmount: ticketAmount ?? this.ticketAmount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticketId': ticketId,
      'ticketTitle': ticketTitle,
      'ticketCoverUrl': ticketCoverUrl,
      'ticketAmount': ticketAmount,
    };
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      ticketId: json['ticketId'] as String? ?? '',
      ticketTitle: json['ticketTitle'] as String? ?? 'Untitled Ticket',
      ticketCoverUrl: json['ticketCoverUrl'] as String? ?? '',
      ticketAmount: json['ticketAmount'] as int? ?? 0,
    );
  }

  @override
  String toString() {
    return 'TicketModel(ticketId: $ticketId, ticketTitle: $ticketTitle, ticketCoverUrl: $ticketCoverUrl, ticketAmount: $ticketAmount)';
  }
}
