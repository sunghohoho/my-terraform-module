variable "name" {
  description = "NAT 이름"
  type = string
}

variable "subnet_id" {
  description = "NAT 서브넷"
  type = string
}

variable "tags" {
  description = "태그 목록"
  type = map(string)
  default = {}
}

variable "azs" {
  description = "CIDR 목록에 1:1 매칭 되는 가용영역 목록"
  type        = list(string)
}

variable "prefix" {
  description = "리소스 접두사"
  type        = string
}