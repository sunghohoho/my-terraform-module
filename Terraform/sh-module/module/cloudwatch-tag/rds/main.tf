
data "aws_db_instance" "target" {
  count = length(var.identifier)
  db_instance_identifier = var.identifier[count.index]
}

resource "aws_cloudwatch_metric_alarm" "This" {
  count = length(var.identifier) * length(var.threshold)
    #알람이름 변경 필요
#   alarm_name = "${data.aws_instances.nametagging[count.index % length(data.aws_instances.nametagging)].tags["Name"]}.${var.metric_name}#${var.threshold[count.index % length(var.threshold)]}.Lv${var.level[count.index % length(var.level)]}"
  # alarm_name = "${data.aws_db_instance.target.instance_identifier}-${var.metric_name}.${var.threshold[count.index % length(var.threshold)]}.LV${var.level[count.index % length(var.level)]}"
   alarm_name = "${var.identifier[count.index % length(var.identifier)]}-${var.metric_name}.${var.threshold[count.index % length(var.threshold)]}.LV${var.level[count.index % length(var.level)]}"
  
  comparison_operator = var.comparison
  evaluation_periods  = var.evaluation
  threshold           = var.threshold[count.index % length(var.threshold)]
  alarm_description   = "-${var.metric_name}"

  metric_query {
    id        = "m1"
    metric {
    metric_name = var.metric_name
    namespace           = "AWS/RDS"
    dimensions = {
      DBInstanceIdentifier = var.identifier[count.index % length(var.identifier)]
    }
    period    = var.period
    stat      = var.stat
    # unit      = var.unit
    }
    return_data = true
  }
}
