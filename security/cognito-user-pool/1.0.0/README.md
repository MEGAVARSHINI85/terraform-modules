## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_user_pool.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advanced_security_mode"></a> [advanced\_security\_mode](#input\_advanced\_security\_mode) | Advanced security mode for the Cognito User Pool (OFF, AUDIT, ENFORCED) | `string` | `"OFF"` | no |
| <a name="input_attribute_data_type"></a> [attribute\_data\_type](#input\_attribute\_data\_type) | Data type of the primary user pool attribute | `string` | `"String"` | no |
| <a name="input_cognito_user_pool_name"></a> [cognito\_user\_pool\_name](#input\_cognito\_user\_pool\_name) | The name of the Cognito User Pool | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Deletion protection for the Cognito User Pool (ACTIVE or INACTIVE) | `string` | `"ACTIVE"` | no |
| <a name="input_mutable"></a> [mutable](#input\_mutable) | Whether the primary user pool attribute can be changed after user creation | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the primary user pool attribute (typically 'email') | `string` | `"email"` | no |
| <a name="input_post_confirmation_lambda_arn"></a> [post\_confirmation\_lambda\_arn](#input\_post\_confirmation\_lambda\_arn) | ARN of the Lambda function to invoke after user confirmation | `string` | n/a | yes |
| <a name="input_required"></a> [required](#input\_required) | Whether the primary user pool attribute is required for user registration | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the Cognito User Pool | `map(string)` | n/a | yes |
| <a name="input_user_pool_schemas"></a> [user\_pool\_schemas](#input\_user\_pool\_schemas) | List of additional custom user pool attributes (schema) | <pre>list(object({<br/>    attribute_data_type = string<br/>    name                = string<br/>    required            = bool<br/>    mutable             = bool<br/>    string_attribute_constraints = optional(object({<br/>      min_length = number<br/>      max_length = number<br/>    }))<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the Cognito User Pool |
| <a name="output_deletion_protection"></a> [deletion\_protection](#output\_deletion\_protection) | Deletion protection status of the Cognito User Pool |
| <a name="output_id"></a> [id](#output\_id) | ID of the Cognito User Pool |
| <a name="output_lambda_config"></a> [lambda\_config](#output\_lambda\_config) | Lambda configuration for the Cognito User Pool |
| <a name="output_name"></a> [name](#output\_name) | Name of the Cognito User Pool |
| <a name="output_user_pool_add_ons"></a> [user\_pool\_add\_ons](#output\_user\_pool\_add\_ons) | User Pool Add-Ons configuration |