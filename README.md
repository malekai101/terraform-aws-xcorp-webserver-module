# X Corp AWS VPC Module 

This module builds out a simple web environment which is compliant to the standards of X Corp.


## Usage

```hcl
module "webservers" {
    source = "malekai101/xcorp-webserver-module"

    project_name = "sample project"
    subnet_id = 1234567
}
```