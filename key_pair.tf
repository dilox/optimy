resource "aws_key_pair" "optimy_key" {
  key_name   = "optimy_key"
  public_key = "${file("optimy_key.pub")}"
}