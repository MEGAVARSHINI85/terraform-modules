module "elastic_ip" {
  source = "git::https://github.com/MEGAVARSHINI85/terraform-modules.git//network/elastic-ip/1.0.0"

  elastic_ip_name = "${var.nat_gateway_name}-eip"
  tags            = var.tags
}