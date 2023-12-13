# ec2 인스턴스 생성
resource "aws_instance" "this" {
  count = length(var.azs)
  ami = var.ami
  availability_zone = var.azs[count.index]
  subnet_id = var.subnet_id
  instance_type = var.type
  associate_public_ip_address = var.abc == "public" ? true : false

  root_block_device {
    volume_size = var.volume
    volume_type = var.voltype
    delete_on_termination = true
  }

  tags = merge(
    {
      "Name" = format(
        "${var.prefix}-${var.suffix}-%s",
        substr(element(var.azs, count.index), -1, 1),
      )
    },
    var.tags
  )
}