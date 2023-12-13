
resource "aws_eip" "this" {
    count = length(var.azs)

    vpc = true
    
    tags = merge(
    {
      "Name" = format(
        "${var.prefix}-eip-%s",
        substr(element(var.azs, count.index), -1, 1),
      )
    },
    var.tags
  )
}

# NAT 게이트웨이 생성
resource "aws_nat_gateway" "this" {
  count = length(var.azs)
  allocation_id = aws_eip.this[count.index].id
  subnet_id     = var.subnet_id

   tags = merge(
    {
      "Name" = format(
        "${var.prefix}-nat-%s",
        substr(element(var.azs, count.index), -1, 1),
      )
    },
    var.tags
  )
}
