class FeedbackModel
{
  String motionText;

  FeedbackModel(this.motionText);

  factory FeedbackModel.fromJson(dynamic json)
  {
    return FeedbackModel("${json['motion']}");
  }

  Map toJson() =>  {
    'motion': motionText
  };
}