/*
Please update the example values here to override the default values in variables.tf.
Any variables in variables.tf can be overridden here, just copy them over and modify the value.
Overriding variables here keeps the variables.tf as a clean local reference.
*/

/*
Credentials are automatically detected from standard AWS authentication means:
 - AWS creds file used with AWS CLI (~/.aws/credentials)
 - Environment variables (AWSACCESSKEYID, AWSSECRETACCESSKEY)
 - IAM Roles (preferred for EC2, ECS)
 - AWS SSO (aws sso login)
If none of these are available to you, you can provide the credentials directly below (uncomment access_key, secret_key and provide values).
!!! However this is considered a security anti-pattern. !!!
For more documentation on how to authenticate, reference the link below:
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration
*/
#access_key = ""
#secret_key = ""

# Specify the region and AZs to use.
region = ""
availability_zone1 = ""
availability_zone2 = ""

/*
To deploy a new TGW, inspect vpc, and two spoke VPCs, specify true to all three variables.
Otherwise, specify false as needed and provide the relevant values in the secctions below.
Reference the sections below for more information on additional variables needed.
*/
create_tgw = true
create_inspect_vpc = true
create_spokes = true

/* 
If using an existing tgw but need an inspect vpc:
  set create_tgw = false, create inspect_vpc = true, and choose if you want spokes
  then uncomment and fill out the variables below:
  (you may also need to set the tgw_connect_peer1/2_inside_cidr to unique values)
*/
#existing_tgw_id = ""
#existing_tgw_security_route_table_id = ""
#existing_tgw_spoke_route_table_id = ""
#tgw_connect_peer1_inside_cidr = ""
#tgw_connect_peer2_inside_cidr = ""

/* 
If using an existing tgw and inspect vpc:
  set create_tgw = false, create inspect_vpc = false, and choose if you want spokes
  then fill out the variables below:
  (you may also need to set the tgw_connect_peer1/2_inside_cidr to unique values)
*/
#existing_vpc_id = ""
#existing_public_subnet1_id = ""
#existing_private_subnet1_id = ""
#existing_public_subnet2_id = ""
#existing_private_subnet2_id = ""
#existing_tgw_id = ""
#existing_tgw_security_route_table_id = ""
#existing_tgw_spoke_route_table_id = ""
#existing_tgw_connect_attachment_id = ""
#tgw_connect_peer1_inside_cidr = ""
#tgw_connect_peer2_inside_cidr = ""


# Specify the name of the keypair that the FGTs will use.
keypair = ""

# Specify the CIDR block which you will be logging into the FGTs from.
cidr_for_access = ""

# Specify a tag prefix that will be used to name resources.
tag_name_prefix = "poc"

# Specify the instance type, reference variables.tf for a list of values.
instance_type = "c6i.xlarge"

# Specify the FortiOS version to use 7.2, 7.4, or 7.6
fortios_version = "7.6"

/*
For license_type, specify byol, flex, or payg.

To use traditional byol license files, place the license files in this root directory (same as this file) and specify the file names.
Otherwise, leave these as empty strings.
fgt1_byol_license = "fgt1-license.lic"
fgt2_byol_license = "fgt2-license.lic"

To use FortiFlex tokens, please provide the token values like so.
Otherwise, leave these as empty strings.
fgt1_fortiflex_token = "1A2B3C4D5E6F7G8H9I0J"
fgt2_fortiflex_token = "2B3C4D5E6F7G8H9I0J1K"
*/
license_type = "payg"
fgt1_byol_license = ""
fgt2_byol_license = ""
fgt1_fortiflex_token = ""
fgt2_fortiflex_token = ""