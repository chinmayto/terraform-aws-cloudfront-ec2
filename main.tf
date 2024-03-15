####################################################
# Create two VPC and components
####################################################

module "vpc" {
  source               = "./modules/vpc"
  name                 = "VPC-A"
  aws_region           = var.aws_region
  vpc_cidr_block       = var.vpc_cidr_block #"10.1.0.0/16"
  public_subnets_cidrs = [cidrsubnet(var.vpc_cidr_block, 8, 1)]
  enable_dns_hostnames = var.enable_dns_hostnames
  aws_azs              = var.aws_azs
  common_tags          = local.common_tags
  naming_prefix        = local.naming_prefix
}

####################################################
# Create EC2 Server Instances
####################################################

module "web_server" {
  source           = "./modules/web"
  instance_type    = var.instance_type
  instance_key     = var.instance_key
  subnet_id        = module.vpc.public_subnets[0]
  vpc_id           = module.vpc.vpc_id
  ec2_name         = "Web Server"
  sg_ingress_ports = var.sg_ingress_public
  common_tags      = local.common_tags
  naming_prefix    = local.naming_prefix
}


####################################################
# Create AWS Cloudfront distribution
####################################################
module "cloud_front" {
  source          = "./modules/cloud-front"
  ec2_public_dns  = module.web_server.ec2_public_dns
  common_tags     = local.common_tags
  naming_prefix   = local.naming_prefix
}

/*
####################################################
# S3 bucket policy to allow access from cloudfront
####################################################
module "s3_cf_policy_primary" {
  source                      = "./modules/s3-cf-policy"
  bucket_id                   = module.s3_website.static_website_id
  bucket_arn                  = module.s3_website.static_website_arn
  cloudfront_distribution_arn = module.cloud_front.cloudfront_distribution_arn
}

*/