module "label" {
  source = "github.com/robc-io/terraform-null-label.git?ref=0.16.1"

  name = var.name

  tags = {
    Terraform = true
    VpcType   = var.vpc_type
  }

  environment = var.environment
  namespace   = var.namespace
}

module "db" {
  source = "github.com/terraform-aws-modules/terraform-aws-rds?ref=master"

  identifier = module.label.id
  name       = module.label.name

  engine               = "postgres"
  engine_version       = "9.6.9"
  family               = "postgres9.6"
  major_engine_version = "9.6"

  instance_class = var.instance_class

  allocated_storage = 5
  storage_encrypted = false


  username = var.username
  password = var.password

  port = "5432"

  vpc_security_group_ids = [var.security_group]
  subnet_ids             = var.subnet_ids

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 0

  final_snapshot_identifier = "cachet"
  deletion_protection       = false

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  tags = module.label.tags
}

//module "postgres" {
//  source = "./postgres"
//
//  host     = module.db.this_db_instance_address
//  password = module.db.this_db_instance_username
//  username = module.db.this_db_instance_password
////  password = var.password
////  username = var.username
//}

//variable "password" {}
//variable "username" {}
//variable "host" {}

provider "postgresql" {
  host     = module.db.this_db_instance_address
  password = module.db.this_db_instance_username
  username = module.db.this_db_instance_password

  //  host            = var.host
  //  username        = var.username
  //  password        = var.password

  port            = 5432
  database        = "cachet"
  sslmode         = "require"
  connect_timeout = 15
}

resource "postgresql_database" "my_db" {
  name              = "cachet"
  owner             = "cachet"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
}