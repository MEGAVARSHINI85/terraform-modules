# ==============================================================================
# AWS Cognito User Pool Domain Examples
# ==============================================================================

# Example 1: Amazon Cognito Domain (Recommended for most use cases)
module "cognito_domain" {
  source = "git::https://github.com/MEGAVARSHINI85/terraform-modules.git//security/cognito-user-pool-domain/1.0.0"

  domain       = "production-auth-portal"
  user_pool_id = "us-east-1_ABC123DEF"
}