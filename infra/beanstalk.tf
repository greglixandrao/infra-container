resource "aws_elastic_beanstalk_application" "beanstalk-app" {
  name        = var.name
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "beanstalk-environment" {
  name                = var.environment
  application         = aws_elastic_beanstalk_application.beanstalk-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.3.4 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.server
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }
}

resource "aws_elastic_beanstalk_application_version" "default" {
  depends_on = [
    aws_elastic_beanstalk_environment.beanstalk-environment,
    aws_elastic_beanstalk_application.beanstalk-app,
    aws_s3_bucket_object.docker
  ]
  name        = var.environment
  application = var.name
  description = var.description
  bucket      = aws_s3_bucket.beanstalk_deploys.id
  key         = aws_s3_bucket_object.docker.id
}
