
resource "aws_cloudwatch_metric_alarm" "This" {
alarm_name = "${var.target}-${var.metric}-${var.threshold}"
comparison_operator = var.comparison
 metric_name = var.metric
 namespace = "AWS/ApplicationELB"
 period = var.period
 statistic = var.statistic
threshold = var.threshold
evaluation_periods = var.evaluation
dimensions = {
  LoadBalacer = var.target
    }

}