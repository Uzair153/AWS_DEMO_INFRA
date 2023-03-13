
resource "aws_instance" "S1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.test-key.key_name
  security_groups = ["${aws_security_group.SG.name}"]
  # vpc_security_group_ids = [aws_security_group.SG.id]
  # subnet_id     = aws_subnet.subnet_test.id
  tags = {
    Name = var.tag
  }
}