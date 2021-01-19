variable vpc_id {
    description = "The ID of the VPC"
}

variable subnet_id {
    description = "The ID of the subnet for the instances."
}

variable ssh_group_id {
    description = "ID of the SSH security group"
}

variable project_name {
    description = "The name of the project."
}

variable server_count {
    description = "The number of servers to build."
}

variable key {
    description = "SSH key to admin servers"
}
