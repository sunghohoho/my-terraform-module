locals {
  major_engine_version = join(".", slice(split(".", var.engine_ver), 0, 2))
}


resource "aws_db_instance" "name" {
  count = length(var.azs)
  db_name = var.prefix
  identifier = var.identity
  availability_zone = var.azs[count.index]
  instance_class = var.class
  allocated_storage = var.storage   
  storage_type = var.storage_type
  engine = var.engine
  engine_version = var.engine_ver
  multi_az = var.multiaz
  auto_minor_version_upgrade = var.minor
  backup_window = var.backuptime
  maintenance_window = var.maintenancetime

    username = var.username
    password = var.password
    parameter_group_name = aws_db_parameter_group.this.name
    db_subnet_group_name = var.subnet_group
    option_group_name = aws_db_option_group.this.name
    skip_final_snapshot = true

  tags = merge(
    {
      "Name" = format(
        "${var.prefix}-${var.suffix}"
      )
    },
    var.tags
  )
}

resource "aws_db_parameter_group" "this" {
  name = "${var.prefix}-${var.suffix}-parametergroup"
  description = "${var.prefix}-${var.suffix}"
  # 버전만 파싱하는거 추가 필요 
  # family = "${var.engine}${replace(var.engine_ver, ".", "")}"
  family = "mysql8.0"

  tags = merge(
    {
      "Name" = format(
        "${var.prefix}-parametergroup"
      )
    },
    var.tags
  )
}

resource "aws_db_option_group" "this" {
    name = "${var.prefix}-${var.suffix}-optiongroup"
    engine_name = var.engine
    major_engine_version = local.major_engine_version
}
