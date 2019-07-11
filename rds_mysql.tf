resource "aws_db_instance" "optimy_db_test" {
  identifier_prefix   = "optimy"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = "optimy_test_database"
  username            = "admin"
  password            = "optimy123"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.instance.id]
}

