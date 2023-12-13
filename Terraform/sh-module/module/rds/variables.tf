variable "prefix" {
  description = "rds 접두사"
  type = string
}

variable "suffix" {
  description = "rds 접미사"
  type = string
}

variable "identity" {
  description = "db 식별자"
  type = string
}

variable "azs" {
  description = "가용영역"
  type = list(string)
}

variable "class" {
  description = "db 인스턴스 class, ex) t3.micro"
  type = string
}

variable "engine" {
  description = "db 엔진"
  type = string
}

variable "engine_ver" {
  description = "db 엔진 버전"
  type = string
}

variable "multiaz" {
  description = "multiaz 유무 true or false"
  type = bool
}

variable "minor" {
  description = "minor 유지관리 유무 true or false"
  type = bool
}

variable "backuptime" {
  description = "backuptime, utc 기준, ex) 16:50-17:20"
  type = string
}

variable "maintenancetime" {
  description = "유지관리 기간, utc 기간, 17-18시 기준 한국기준 새벽시간 ex) sun:17:50-sun:18:20"
  type = string
}

variable "storage_type" {
  description = "스토리지 타입, ex) gp2, gp3"
  type = string
}

variable "storage" {
  description = "스토리지 크기, ex) 20, 30"
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}


# variable "parameter_group" {
#   type = string
# }


variable "subnet_group" {
  type = string
}

variable "tags" {
    description = "생성될 리소스에 부여할 태그 목록"
    type = map(string)
    default = {}
}


# variable "dbfamily" {
#   type = string
# }