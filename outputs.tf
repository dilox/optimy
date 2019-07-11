output "optimy_instance_public_ip" {
  value       = aws_instance.optimy-test.public_ip
  description = "Public ip of optimy-test instance"
}
output "db_address" {
  value       = aws_db_instance.optimy_db_test.address
  description = "Connect to the database at this endpoint"
}

output "db_port" {
  value       = aws_db_instance.optimy_db_test.port
  description = "The port the database is listening on"
}