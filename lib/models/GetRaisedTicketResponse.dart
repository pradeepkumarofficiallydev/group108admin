class GetRaisedTicketResponse {
  bool? status;
  List<Tickets>? tickets;

  GetRaisedTicketResponse({this.status, this.tickets});

  GetRaisedTicketResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(new Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.tickets != null) {
      data['tickets'] = this.tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}






class Tickets {
  int? id;
  dynamic? ticketId;
  dynamic? userId;
  dynamic? userName;
  dynamic? issueType;
  dynamic? requestDate;
  dynamic? requestTime;
  dynamic? addedBy;
  dynamic? managerId;
  dynamic? managerName;
  dynamic? maintainer;
  dynamic? maintainerName;
  dynamic? status;
  dynamic? issueAttachment;
  dynamic? ownerNote;
  dynamic? maintainerReply;
  dynamic? createdDate;
  dynamic? createdTime;
  dynamic? ques1;
  dynamic? ques2;
  dynamic? part;
  dynamic? price;
  dynamic? ques3;
  dynamic? ques4;
  dynamic? ques5;
  dynamic? comment;
  dynamic? submitDate;
  dynamic? submitTime;

  Tickets(
      {this.id,
        this.ticketId,
        this.userId,
        this.userName,
        this.issueType,
        this.requestDate,
        this.requestTime,
        this.addedBy,
        this.managerId,
        this.managerName,
        this.maintainer,
        this.maintainerName,
        this.status,
        this.issueAttachment,
        this.ownerNote,
        this.maintainerReply,
        this.createdDate,
        this.createdTime,
        this.ques1,
        this.ques2,
        this.part,
        this.price,
        this.ques3,
        this.ques4,
        this.ques5,
        this.comment,
        this.submitDate,
        this.submitTime});

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    issueType = json['issue_type'];
    requestDate = json['request_date'];
    requestTime = json['request_time'];
    addedBy = json['added_by'];
    managerId = json['manager_id'];
    managerName = json['manager_name'];
    maintainer = json['maintainer'];
    maintainerName = json['maintainer_name'];
    status = json['status'];
    issueAttachment = json['issue_attachment'];
    ownerNote = json['owner_note'];
    maintainerReply = json['maintainer_reply'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    ques1 = json['ques_1'];
    ques2 = json['ques_2'];
    part = json['part'];
    price = json['price'];
    ques3 = json['ques_3'];
    ques4 = json['ques_4'];
    ques5 = json['ques_5'];
    comment = json['comment'];
    submitDate = json['submit_date'];
    submitTime = json['submit_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_id'] = this.ticketId;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['issue_type'] = this.issueType;
    data['request_date'] = this.requestDate;
    data['request_time'] = this.requestTime;
    data['added_by'] = this.addedBy;
    data['manager_id'] = this.managerId;
    data['manager_name'] = this.managerName;
    data['maintainer'] = this.maintainer;
    data['maintainer_name'] = this.maintainerName;
    data['status'] = this.status;
    data['issue_attachment'] = this.issueAttachment;
    data['owner_note'] = this.ownerNote;
    data['maintainer_reply'] = this.maintainerReply;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    data['ques_1'] = this.ques1;
    data['ques_2'] = this.ques2;
    data['part'] = this.part;
    data['price'] = this.price;
    data['ques_3'] = this.ques3;
    data['ques_4'] = this.ques4;
    data['ques_5'] = this.ques5;
    data['comment'] = this.comment;
    data['submit_date'] = this.submitDate;
    data['submit_time'] = this.submitTime;
    return data;
  }
}
