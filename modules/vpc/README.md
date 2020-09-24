# Terraform Network Module

This submodule is part of the the `terraform-gcp-network` module. It creates a VPC network.

## Usage

Basic usage of this submodule is as follows:

```hcl
module "vpc" {
    source  = "git@github.com:global-build/terraform-google-vpc/modules/vpc/?ref=master"

    project_id   = "<PROJECT ID>"
    network_name = "test-vpc"
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| auto\_create\_subnetworks | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | bool | `"false"` | no |
| delete\_default\_routes\_on\_create_ | If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted | bool | `"false"` | no |
| description | An optional description of this resource. The resource must be recreated to modify this field. | string | `""` | no |
| network\_name | The name of the network being created | string | n/a | yes |
| project\_id | The ID of the project where this VPC will be created | string | n/a | yes |
| routing\_mode | The network routing mode (default 'GLOBAL') | string | `"GLOBAL"` | no |


## Outputs

| Name | Description |
|------|-------------|
| network\_name | The name of the VPC being created |
| network\_self\_link | The URI of the VPC being created |