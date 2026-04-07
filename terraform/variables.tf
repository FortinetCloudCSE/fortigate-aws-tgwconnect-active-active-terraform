variable "region" {
  description = "Provide the region to deploy the VPC in"
  type        = string
  default     = "us-east-1"
}
variable "availability_zone1" {
  description = "Provide the first availability zone to create the subnets in"
  type        = string
  default     = "us-east-1a"
}
variable "availability_zone2" {
  description = "Provide the second availability zone to create the subnets in"
  type        = string
  default     = "us-east-1b"
}
variable "inspection_vpc_cidr" {
  description = "Provide the network CIDR for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "inspection_vpc_public_subnet_cidr1" {
  description = "Provide the network CIDR for the public subnet1 in inspection vpc"
  type        = string
  default     = "10.0.1.0/24"
}
variable "inspection_vpc_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in inspection vpc"
  type        = string
  default     = "10.0.3.0/24"
}
variable "inspection_vpc_attachment_subnet_cidr1" {
  description = "Provide the network CIDR for the attachment subnet1 in inspection vpc"
  type        = string
  default     = "10.0.5.0/24"
}
variable "inspection_vpc_public_subnet_cidr2" {
  description = "Provide the network CIDR for the public subnet2 in inspection vpc"
  type        = string
  default     = "10.0.2.0/24"
}
variable "inspection_vpc_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in inspection vpc"
  type        = string
  default     = "10.0.4.0/24"
}
variable "inspection_vpc_attachment_subnet_cidr2" {
  description = "Provide the network CIDR for the attachment subnet2 in inspection vpc"
  type        = string
  default     = "10.0.6.0/24"
}
variable "create_inspect_vpc" {
  description = "Set to true to deploy a new inspection VPC, otherwise set to false"
  type        = bool
  default     = true

  validation {
    condition     = contains([true, false], var.create_inspect_vpc)
    error_message = "Create Inspect VPC must be true or false"
  }
}
variable "create_tgw" {
  description = "Set to true to deploy a new TGW, otherwise set to false"
  type        = bool
  default     = true

  validation {
    condition     = contains([true, false], var.create_tgw)
    error_message = "Create TGW must be true or false"
  }
}
variable "create_spokes" {
  description = "Set to true to also deploy two spoke VPCs, otherwise set to false"
  type        = bool
  default     = true

  validation {
    condition     = contains([true, false], var.create_spokes)
    error_message = "Create spokes must be true or false"
  }
}
variable "existing_vpc_id" {
  description = "Provide the existing vpc id"
  type        = string
  default     = ""
}
variable "existing_public_subnet1_id" {
  description = "Provide the existing vpc public subnet1 id"
  type        = string
  default     = ""
}
variable "existing_public_subnet2_id" {
  description = "Provide the existing vpc public subnet2 id"
  type        = string
  default     = ""
}
variable "existing_private_subnet1_id" {
  description = "Provide the existing vpc private subnet1 id"
  type        = string
  default     = ""
}
variable "existing_private_subnet2_id" {
  description = "Provide the existing vpc private subnet2 id"
  type        = string
  default     = ""
}
variable "tgw_bgp_asn" {
  description = "[This is needed for either new or existing TGW] Provide a BGP ASN for TGW"
  type        = string
  default     = "64512"
}
variable "tgw_connect_cidr" {
  description = "[This is needed for either new or existing TGW] Provide a network CIDR for TGW Connect (TGW CIDR for Connect endpoints)"
  type        = string
  default     = "100.64.0.0/24"
}
variable "tgw_connect_peer1_inside_cidr" {
  description = "[This is needed for either new or existing TGW] Provide a network CIDR for Tgw Connect Peer1 (BGP addresses) *** must be a /29 block from the 169.254.0.0/16 range starting from 169.254.5.8 ***/29"
  type        = string
  default     = "169.254.6.0/29"
}
variable "tgw_connect_peer2_inside_cidr" {
  description = "[This is needed for either new or existing TGW] Provide a network CIDR for Tgw Connect Peer2 (BGP addresses) *** must be a /29 block from the 169.254.0.0/16 range starting from 169.254.5.8 ***/29"
  type        = string
  default     = "169.254.7.0/29"
}
variable "existing_tgw_id" {
  description = "[Leave blank if an existing tgw will not be used] If you are using an existing TGW, provide the TGW  ID to create VPC routes to reach it"
  type        = string
  default     = ""
}
variable "existing_tgw_security_route_table_id" {
  description = "[Leave blank if an existing tgw will not be used] If you are using an existing Transit GW, provide the Transit GW RouteTable ID for the security VPC to associate to"
  type        = string
  default     = ""
}
variable "existing_tgw_spoke_route_table_id" {
  description = "[Leave blank if an existing tgw will not be used] If you are using an existing Transit GW, provide the Transit GW RouteTable ID that your spoke VPCs are associated with"
  type        = string
  default     = ""
}
variable "existing_tgw_connect_attachment_id" {
  description = "[Leave blank if an existing tgw will not be used] If you are using an existing TGW, provide the TGW Connect Attachment ID to create Connect Peers to it"
  type        = string
  default     = ""
}
variable "spoke_vpc1_cidr" {
  description = "Provide the network CIDR for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}
variable "spoke_vpc1_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in spoke vpc1"
  type        = string
  default     = "10.1.1.0/24"
}
variable "spoke_vpc1_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in spoke vpc1"
  type        = string
  default     = "10.1.2.0/24"
}
variable "spoke_vpc2_cidr" {
  description = "Provide the network CIDR for the VPC"
  type        = string
  default     = "10.2.0.0/16"
}
variable "spoke_vpc2_private_subnet_cidr1" {
  description = "Provide the network CIDR for the private subnet1 in spoke vpc2"
  type        = string
  default     = "10.2.1.0/24"
}
variable "spoke_vpc2_private_subnet_cidr2" {
  description = "Provide the network CIDR for the private subnet2 in spoke vpc2"
  type        = string
  default     = "10.2.2.0/24"
}
variable "instance_type" {
  description = "FortiGate EC2 instance type"
  type        = string
  default     = "c6i.xlarge"

  validation {
    condition     = can(regex("^(c5|c5n|c6i|c6in|c6g|c6gn|c7i|c7g|c7gn|c8g|c8gn)\\.(large|xlarge|2xlarge|4xlarge|8xlarge|9xlarge|16xlarge|18xlarge|24xlarge)$", var.instance_type))
    error_message = "Instance type must be a supported FortiGate instance type. Reference the instance type list in variables.tf."
  }
  /*
  Here is a list of supported instance types:
  c5.large 
  c5.xlarge 
  c5.2xlarge 
  c5.4xlarge 
  c5.9xlarge 
  c5.18xlarge 
  c5n.large 
  c5n.xlarge 
  c5n.2xlarge 
  c5n.4xlarge 
  c5n.9xlarge 
  c5n.18xlarge 
  c6i.large 
  c6i.xlarge 
  c6i.2xlarge 
  c6i.4xlarge 
  c6i.8xlarge 
  c6i.16xlarge 
  c6i.24xlarge 
  c6in.large 
  c6in.xlarge 
  c6in.2xlarge 
  c6in.4xlarge 
  c6in.8xlarge 
  c6in.16xlarge 
  c7i.large
  c7i.xlarge
  c7i.2xlarge
  c7i.4xlarge
  c7i.8xlarge
  c7i.16xlarge
  c6g.large 
  c6g.xlarge 
  c6g.2xlarge 
  c6g.4xlarge 
  c6g.8xlarge 
  c6g.16xlarge 
  c6gn.large 
  c6gn.xlarge 
  c6gn.2xlarge 
  c6gn.4xlarge 
  c6gn.8xlarge 
  c6gn.16xlarge 
  c7g.large 
  c7g.xlarge 
  c7g.2xlarge 
  c7g.4xlarge 
  c7g.8xlarge 
  c7g.16xlarge 
  c7gn.large 
  c7gn.xlarge 
  c7gn.2xlarge 
  c7gn.4xlarge 
  c7gn.8xlarge 
  c7gn.16xlarge
  c8g.large
  c8g.xlarge
  c8g.2xlarge
  c8g.4xlarge
  c8g.8xlarge
  c8g.16xlarge
  c8gn.large
  c8gn.xlarge
  c8gn.2xlarge
  c8gn.4xlarge
  c8gn.8xlarge
  c8gn.16xlarge
  */
}
variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  type        = string
  default     = ""
}
variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instances"
  type        = string
  default     = ""
}
variable "encrypt_volumes" {
  description = "Set to encrypt the FortiGate instances OS and Log volumes with your account's KMS default master key for EBS.  Otherwise set to false to leave unencrypted"
  type        = bool
  default     = true

  validation {
    condition     = contains([true, false], var.encrypt_volumes)
    error_message = "Encrypt volumes must be true or false"
  }
}
variable "fortios_version" {
  description = "FortiOS version to use"
  type        = string
  default     = "7.4"

  validation {
    condition     = contains(["7.2", "7.4", "7.6"], var.fortios_version)
    error_message = "FortiOS version must be 7.2, 7.4, or 7.6"
  }
}
variable "license_type" {
  description = "FortiGate license type"
  type        = string
  default     = "payg"

  validation {
    condition     = contains(["byol", "flex", "payg"], var.license_type)
    error_message = "License type must be byol, flex, or payg"
  }
}
variable "fgt_bgp_asn" {
  description = "Provide the BGP ASN for the FortiGates"
  type        = string
  default     = "65000"
}
variable "fgt1_byol_license" {
  description = "[BYOL only] Provide the BYOL license filename for FortiGate1 and place the file in the root module folder"
  type        = string
  default     = ""
}
variable "fgt2_byol_license" {
  description = "[BYOL only]Provide the BYOL license filename for FortiGate2 and place the file in the root module folder"
  type        = string
  default     = ""
}
variable "fgt1_fortiflex_token" {
  description = "[FortiFlex only]Provide the FortiFlex Token for FortiGate1 (ie 1A2B3C4D5E6F7G8H9I0J)"
  type        = string
  default     = ""
}
variable "fgt2_fortiflex_token" {
  description = "[FortiFlex only]Provide the FortiFlex Token for FortiGate2 (ie 2B3C4D5E6F7G8H9I0J1K)"
  type        = string
  default     = ""
}
variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  type        = string
  default     = "stack-1"
}