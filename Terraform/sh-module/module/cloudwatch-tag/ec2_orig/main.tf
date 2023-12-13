
data "aws_instances" "target" {
  instance_tags = {
    Project = "cw"
  }
}

data "aws_instance" "nametagging" {
  count = length(data.aws_instances.target.ids)
  instance_id = data.aws_instances.target.ids[count.index] 
}

resource "aws_cloudwatch_metric_alarm" "This" {
  count = (length(data.aws_instances.target.ids) * length(var.threshold))
    #알람이름 변경 필요
  alarm_name = "${data.aws_instance.nametagging[count.index % length(data.aws_instances.target.ids)].tags["Name"]}.${var.metric_name}#${var.threshold[count.index % length(var.threshold)]}.Lv${var.level[count.index % length(var.level)]}"  
  # alarm_name = "${data.aws_instances.target.ids[count.index % length(data.aws_instances.target.ids)].tags["Name"]}.${var.metric_name}#${var.threshold[count.index % length(var.threshold)]}.Lv${var.level[count.index % length(var.level)]}"
  comparison_operator = var.comparison
  evaluation_periods  = var.evaluation
  threshold           = var.threshold[count.index % length(var.threshold)]
  alarm_description   = "-${var.metric_name}"
#   alarm_actions       = [var.notification_arn]

  metric_query {
    id        = "m1"
    metric {
    metric_name = var.metric_name
    namespace  = var.namespace
    dimensions = {
      InstanceId = data.aws_instances.target.ids[count.index % length(data.aws_instances.target.ids)]
    }
    period    = var.period
    stat      = var.stat
    unit      = var.unit
    }
    return_data = true
  }
}
