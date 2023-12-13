# output "a-id" {
#   description = "생성된 nat gateway id"
#   value = aws_nat_gateway.this[*].id
# }

# output "c-id" {
#   description = "생성된 nat gateway id"
#   value = aws_nat_gateway.this[*].id
# }

output "ids" {
  description = "생성된 NAT Gateway ID"
  value       = aws_nat_gateway.this[*].id
}

