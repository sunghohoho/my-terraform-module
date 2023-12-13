# variable "prefix" {
#   type = string
# }

variable "evaluation" {
  type = string
}

variable "threshold" {
  type = list(number)
}

variable "metric_name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "period" {
  type = string
}

variable "stat" {
  type = string
}

variable "unit" {
  type = string
}

variable "level" {
  type = list(string)
  description = "알람 레벨"
}

variable "comparison" {
  type = string
  description = "조건"
}
