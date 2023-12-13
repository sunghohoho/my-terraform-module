variable "prefix" {
  type = string
}

variable "suffix" {
  type = string
}

variable "internal" {
  type = bool
  description = "alb 타입, internetfacing or internal"
}

variable "type" {
  type = string
  description = "elb 타입, alb or nlb"

  validation {
    condition = contains(["application", "network"], var.type)
    error_message = "application or network 둘 중 하나만 고르세용"
  }
}

variable "subnets" {
  type = list(string)
  description = "alb 위치 시킬 서브넷 위치"
}

variable "port" {
  type = string
  description = "통신할 포트 여러 개 가능"
}

variable "vpc" {
  type = string
  description = "타겟의 vpc"
}

variable "target_instance" {
  type = string
  description = "타겟으로 포함시킬 인스턴스"
}

