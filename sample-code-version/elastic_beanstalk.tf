resource "aws_elastic_beanstalk_application" "app" {
  name        = "app"
  description = "app"
}

# this automatically retrieves the latest solution stack
data "aws_elastic_beanstalk_solution_stack" "php-latest" {
  most_recent = true
  name_regex = "^64bit Amazon Linux (.*) running PHP 8.(.*)$"
}

resource "aws_elastic_beanstalk_environment" "app-prod" {
  name                = "app-prod"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = data.aws_elastic_beanstalk_solution_stack.php-latest.name
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = module.vpc.vpc-id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${module.subnets.private-subnet-1-id}, ${module.subnets.private-subnet-3-id}"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "false"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.app-ec2-role.name
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = module.ssh_security_group.security_group_id
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = module.my_key_pair.key_pair_id
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = aws_iam_role.elasticbeanstalk-service-role.name
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${module.subnets.public-subnet-1-id}, ${module.subnets.public-subnet-2-id}, ${module.subnets.public-subnet-3-id}"
  }
  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "30"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = "Percentage"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "Any 2"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "1"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
  }
}