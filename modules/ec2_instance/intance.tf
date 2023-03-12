
resource "aws_instance" "S1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "${aws_key_pair.test-key.key_name}"
  security_groups = ["${aws_security_group.SG.name}"]
  tags = {
    Name = var.tag
  }
}