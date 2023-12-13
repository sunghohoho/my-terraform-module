output "ec2_id" {
  description = "생성된 ec2 인스턴스 id"
  value = aws_instance.this[*].id
}

# output "nametag" {
#  value = aws_instance.this[*].tags.Name
# }
