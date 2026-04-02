---
title: "Deployment"
chapter: false
menuTitle: "Deployment"
weight: 30
---

Once the prerequisites have been satisfied proceed with the deployment steps below.

1.  Clone this repo with the command below.
```
git clone https://github.com/FortinetCloudCSE/fortigate-aws-tgwconnect-active-active-terraform.git
```

2.  Change directories and modify the terraform.tfvars file with your credentials and deployment information. 

{{% notice note %}} In the terraform.tfvars file, the comments explain what inputs are expected for the variables. For further details on a given variable or to see all possible variables, reference the variables.tf file. {{% /notice %}}
```
cd fortigate-aws-tgwconnect-active-active-terraform/terraform
nano terraform.tfvars
```

3.  When ready to deploy, use the commands below to run through the deployment.
```
terraform init
terraform validate
terraform apply --auto-approve
```

4.  When the deployment is complete, you will see login information for the FortiGates like so.
```
Apply complete! Resources: 61 added, 0 changed, 0 destroyed.

Outputs:

fgt_login_info = <<EOT
-=-=-=-=-=-=-=-=-=-=-
fgt username: admin
fgt1 initial password: i-0a9a4a6b27d894d94
fgt2 initial password: i-0efaa50f29d6be49e
fgt1 login url: https://52.35.202.49
fgt2 login url: https://184.33.209.229
-=-=-=-=-=-=-=-=-=-=-

EOT
tgw_info = <<EOT
-=-=-=-=-=-=-=-=-=-=-
tgw id: tgw-0e46951864851d373
tgw spoke route table id: tgw-rtb-0c01a6e0c3da69aa6
tgw security route table id: tgw-rtb-03c950302097e143f
-=-=-=-=-=-=-=-=-=-=-

EOT
```