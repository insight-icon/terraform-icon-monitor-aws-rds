# terraform-icon-monitor-aws-rds

[![open-issues](https://img.shields.io/github/issues-raw/insight-icon/terraform-icon-monitor-aws-rds?style=for-the-badge)](https://github.com/insight-icon/terraform-icon-monitor-aws-rds/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-icon/terraform-icon-monitor-aws-rds?style=for-the-badge)](https://github.com/insight-icon/terraform-icon-monitor-aws-rds/pulls)

## Features

This module sets up a postegres DB and configures it to run the status page and various long term metrics storage

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl-terraform
module "this" {
   source = "github.com/insight-icon/terraform-icon-monitor-aws-rds"

}
```
## Examples

- [defaults](https://github.com/insight-icon/terraform-icon-monitor-aws-rds/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| postgresql | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | The environment | `string` | `""` | no |
| instance\_class | instance class for DB | `string` | `"db.t3.small"` | no |
| name | The name for the label | `string` | `"prep"` | no |
| namespace | The namespace to deploy into | `string` | `"prod"` | no |
| password | The password to default user | `string` | `"changemenow"` | no |
| security\_group | The sg for rds | `string` | n/a | yes |
| subnet\_ids | The subnet ids for deployment | `list(string)` | n/a | yes |
| username | Default username | `string` | `"icon"` | no |
| vpc\_type | The type of vpc | `string` | `"monitoring"` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_instance\_address | The address of the RDS instance |
| this\_db\_instance\_arn | The ARN of the RDS instance |
| this\_db\_instance\_availability\_zone | The availability zone of the RDS instance |
| this\_db\_instance\_endpoint | The connection endpoint |
| this\_db\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| this\_db\_instance\_id | The RDS instance ID |
| this\_db\_instance\_name | The database name |
| this\_db\_instance\_port | The database port |
| this\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| this\_db\_instance\_status | The RDS instance status |
| this\_db\_parameter\_group\_arn | The ARN of the db parameter group |
| this\_db\_parameter\_group\_id | The db parameter group id |
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [insight-icon](https://github.com/insight-icon)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.