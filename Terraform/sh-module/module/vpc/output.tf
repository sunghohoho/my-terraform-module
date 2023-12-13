output "igw_id" {
  description = "생성된 인터넷 게이트웨이 id"
  value = aws_internet_gateway.this.id
}

output "vpc_id" {
  description = "vpc id"
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "vpc cidr"
  value = aws_vpc.this.cidr_block
}