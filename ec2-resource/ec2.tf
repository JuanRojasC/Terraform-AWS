resource "aws_instance" "jdrc_ec2" {
	ami = "ami-027f2f92dac883acf"
	instance_type = "t2.micro"
	key_name = var.key
	security_groups = ["${aws_security_group.allow_rdp_sg.name}"]
	tags = {
	  "Name" = "C1-Terraform-DH-JDRC"
	}
}

resource "aws_security_group" "allow_rdp_sg" {
	name = "jdrc_allow_rdp"
	description = "Allow rdp traffic"

	ingress {
		from_port = 3389 # By default, the windows server listens onTCP
		to_port = 3389
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

}
