module "web_acl_association" {
  source = "git::https://github.com/MEGAVARSHINI85/terraform-modules.git//security/waf-association/1.0.0"

  resource_arn = "arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/app/my-load-balancer/50dc6c495c0c9188"
  web_acl_arn  = "arn:aws:wafv2:us-west-2:123456789012:webacl/my-web-acl/12345678-1234-1234-1234-123456789012"
}