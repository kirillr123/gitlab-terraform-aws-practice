resource "aws_key_pair" "default" {
  key_name = "default"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgrd1rwl9sEqf2IWlRVwe1WfGyiJusnVf5J7cZWNSftlnPyNiNBZPeThJnyoUBXDCOtD2uhzrMY7qwRhLg+VKL5flZpWdONvp1EV2k6vP+Rx1b9N8KbPc/OsUAFgjcGRWVpO6g4ArUMw7h07XARxAu0Jz3vbEO9/9QpVsGa29IhstwklGOvlM1fPZHZSa3dlg/j+Q3Ottmy5u/2qDoM5NVOM0YlPXsOqLBPkt3OlCfdFEAbAkTWjC+CxKrFVGq1T7AnchZxrXxcdsRm3SovqkwpP/SOKy/Ih5531/3SSxs099R6c/j6UkvuyEXoehqZZqm7JXl11BC2e6+uy4YHOesw== rsa-key-20200419"
}
data "template_file" "user_data" {
template = "${file("init.sh")}"
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20200406.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}
resource "aws_instance" "aws_instance" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "default"
  user_data = "${file("init.sh")}"
}

