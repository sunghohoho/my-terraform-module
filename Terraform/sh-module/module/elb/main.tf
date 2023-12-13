resource "aws_lb" "this" {
  name = "${var.prefix}-${var.suffix}"
  internal = var.internal
  load_balancer_type = var.type
  subnets = var.subnets

}

resource "aws_alb_target_group" "this" {
#   count = length(var.port)
  name = "${var.prefix}-${var.suffix}-tg"
  port = var.port
  vpc_id = var.vpc
  protocol = "HTTP"
}

resource "aws_alb_target_group_attachment" "this" {
    # count = length(var.port)
  target_group_arn = aws_alb_target_group.this.arn
  target_id = var.target_instance
  port = var.port
}

resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port = var.port
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.this.arn
  }
}