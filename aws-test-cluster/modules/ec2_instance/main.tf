resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  user_data              = var.user_data
  
  # These make the instance eligible for free tier
  ebs_optimized = false
  monitoring    = false
  
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  tags = var.tags

  # Wait for the instance to be ready
  # wait_for_fulfillment = true
}
