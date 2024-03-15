# Deploying a cloudfront distribution for EC2 Website using terraform
Deploying a cloudfront distribution for EC2 Website using terraform

Amazon CloudFront is a web service that speeds up distribution of your static and dynamic web content, such as .html, .css, .js, and image files, to your users. CloudFront delivers your content through a worldwide network of data centers called edge locations. When a user requests content that you're serving with CloudFront, the request is routed to the edge location that provides the lowest latency (time delay), so that content is delivered with the best possible performance.

If the content is already in the edge location with the lowest latency, CloudFront delivers it immediately.

If the content is not in that edge location, CloudFront retrieves it from an origin that you've defined—such as an Amazon S3 bucket, a MediaPackage channel, or an HTTP server (for example, a web server) that you have identified as the source for the definitive version of your content.

CloudFront speeds up the distribution of your content by routing each user request through the AWS backbone network to the edge location that can best serve your content.

### Architecture Diagram:

![alt text](/images/diagram.png)

### Step 1: Create an EC2 web server instance in a VPC

### Step 2: Create a cloudfront distribution 

### Terraform Apply Output:
```
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

cloudfront_domain_name = "http://d3q4caj22i0xed.cloudfront.net"
```

EC2 Instance with hosted website

![alt text](/images/ec2.png)

CloudFront Distribution:

![alt text](/images/cfdist.png)

CloudFront Distribution Origin as EC2 as origin:

![alt text](/images/cforigin.png)

Using cloudfront domain name to access EC2 Website

![alt text](/images/website1.png)

Website accessed from country which is not in allowlist (used soft VPN)

![alt text](/images/website2.png)

### Terraform Destroy Output:
```
Destroy complete! Resources: 8 destroyed.
```

### Resources:

AWS CloudFront: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html
