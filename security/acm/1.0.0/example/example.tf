module "acm" {
  source           = "../"
  domain_name      = "poc.dev.assets.google.ai"
  hosted_zone_name = "dev.assets.google.ai"
}