class LogModel {
  String? firstname;
  String? lastname;
  String? email;
  int? issue;
  String? date;
  int? hours;
  String? comments;
  String? activity;

  LogModel(
      {this.issue,
      this.date,
      this.hours,
      this.comments,
      this.activity,
      this.firstname,
      this.lastname,
      this.email});

  factory LogModel.fromJson(Map<String, dynamic> json) => LogModel(
        issue: json["issue"],
        date: json["date"],
        hours: json["hours"],
        comments: json["comments"],
        activity: json["activity"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "issue": issue,
        "date": date,
        "hours": hours,
        "comments": comments,
        "activity": activity,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
      };
}
