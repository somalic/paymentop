# paymentop
# EC2 Instance Module
Structure

`ec2-module/
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md`

A module for creating EC2 instance in AWS.

## Used Variables

- `instance_type` (string) - Type EC2 (default: "t2.micro")
- `disk_size` (number) - Disk size (default: 8GB)
- `disk_type` (string) - Disk type (default: "io1")
- `ami` (string) - The AMI ID (if not specified, the latest version of Ubuntu is used)
- `key_name` (string) - SSH key name
- `ingress_rules` (list(object)) - Rules for SG
- `instance_name` (string) - Name EC2
- `security_group_name` (string) - Name SG

## Outputs

- `instance_id` - ID created EC2 instance
- `security_group_id` - ID created SG
