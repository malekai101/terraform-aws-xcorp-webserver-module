# X Corp AWS Webserver Module 

This module builds out a simple web environment which is compliant to the standards of X Corp.

## Overview
This module creates a group of web servers and public IPs.  Metadata about the VPC and subnet must be passed in.

## Requirements
The calling code must use an `aws` provider.  The account used in the provider must have the rights to create security rules and virtual machines.

## Usage

```hcl
module "webservers" {
    source = "malekai101/xcorp-webserver-module/aws"

    project_name = "Csmith Test"
    subnet_id = "90210"
    ssh_group_id = "90210"
    vpc_id = "90210"
    server_count = 3
}
```