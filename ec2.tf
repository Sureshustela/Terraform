resource "aws_instance" "docker_server" {
  ami = var.ami
  instance_type = var.i_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  root_block_device {
    volume_size = 40
    volume_type = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "docker_server" 
  }

  user_data = file("docker.sh")

}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access only"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}