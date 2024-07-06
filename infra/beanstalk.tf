resource "aws_elastic_beanstalk_application" "beanstalk-app" {
  name        = var.name
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "beanstalk-environment" {
  name                = var.environment
  application         = aws_elastic_beanstalk_application.beanstalk-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.3.4 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfigurationc"
    name      = "InstanceType"
    value     = var.server
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max
  }
  setting {
    namespace = "aws:autoscaling:launchconfigurationc"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }
}
