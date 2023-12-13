variable "name" {
  description = "ec2 이름"
  type = string
}

variable "prefix" {
  description = "인스턴스 이름에 추가할 접두사"
  type        = string
}

variable "suffix" {
  description = "인스턴스 이름에 추가할 접미사"
  type        = string
}

variable "ami" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "subnet_id" {
    description = "subent-id"
    type = string
}

variable "type" {
  description = "ec2 타입"
  type = string
}

variable "tags" {
    description = "생성될 리소스에 부여할 태그 목록"
    type = map(string)
    default = {}
}

variable "abc" {
  description = "public private 유무에 따른 public ip 할당 선택"
  type        = string

  validation {
    condition     = contains(["public", "private"], var.abc)
    error_message = "Valid values for var: type are (public, private)."
  }
}

variable "volume" {
  description = "volume size"
  type = string
}

variable "voltype" {
  description = "volume 타입, gp2 or gp3"
  type = string
}

