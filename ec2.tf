provider "aws" {
  region     = "us-east-1"
  assume_role {
    duration_seconds = 3600
    session_name = "session-name"
    role_arn = arn:aws:iam::985536073477:role/jenkins-role
    
  }  
}

resource "aws_instance" "myec2test" {
  ami           = "ami-00874d747dde814fa"  
  instance_type = "t2.micro"
}
