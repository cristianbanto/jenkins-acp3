resource "aws_instance" "myec2test" {
  ami           = "ami-048f6ed62451373d9"  
  instance_type = "t2.micro"
}
