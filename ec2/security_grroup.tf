data "aws_vpc" "main" {
  id = "vpc-1f459865"
}

resource "aws_security_group" "cloud_int" {
  name        = "cloud_int"
  description = "Allow cloud_int"
  vpc_id      = data.aws_vpc.main.id

  ingress = [
    {
      description      = "allow 22"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false

    },
    {
      description      = "allow 80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]
   
  egress = [
    { 
      description      = "out going trapic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

}
