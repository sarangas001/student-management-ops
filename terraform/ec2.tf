# Security Group
resource "aws_security_group" "k8s_sg" {
  name        = "k8s-cluster-sg"
  description = "Allow traffic for K8s cluster"
  vpc_id      = aws_vpc.main.id

  # SSH 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  # HTTP (Web traffic)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS (Secure Web traffic)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "k8s_server" {
  ami                    = "ami-060e277acade9e1d9" # Ubuntu 22.04 LTS AMI ID 
  instance_type          = "t3.medium" # 2 vCPU, 4GB RAM 
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]
  key_name               = "your-aws-key-pair-name" 

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "student-mgmt-k8s-host"
  }
}

# Output IP Address
output "server_public_ip" {
  value = aws_instance.k8s_server.public_ip
}