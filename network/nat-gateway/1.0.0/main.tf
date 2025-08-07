module "elastic_ip" {
  source = "git::https://github.com/MEGAVARSHINI85/terraform-modules.git//network/elastic-ip/1.0.0"

  elastic_ip_name = "${var.nat_gateway_name}-eip"
  tags            = var.tags
}

resource "aws_nat_gateway" "this" {
  allocation_id = module.elastic_ip.id
  subnet_id     = var.subnet_id

  tags = merge(
    {
      Name = var.nat_gateway_name
    },
    var.tags
  )
}