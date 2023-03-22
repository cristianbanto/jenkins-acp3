provider "aws" {
  region     = "us-east-1"

}

resource "aws_instance" "myec2test" {
  ami           = "ami-0557a15b87f6559cf"  
  instance_type = "t2.micro"
  
  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install openjdk-11-jdk
  sudo ufw allow 8080
  sudo cd /tmp
  wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.87/bin/apache-tomcat-8.5.87.tar.gz
  tar xzvf apache-tomcat-8.5.87.tar.gz 
  sudo systemctl start tomcat
  
  echo "*** Completed Installing apache2"
  EOF
  
  tags = {
    Name = "Apache Server"
  }
}
