cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
enable_dns_support = "true"
enable_dns_hostnames = "true"
map_private_ip_on_launch = "false"
map_public_ip_on_launch = "true"
public_cidr_block_1 = "10.0.1.0/24"
public_cidr_block_2 = "10.0.2.0/24"
public_cidr_block_3 = "10.0.3.0/24"
private_cidr_block_1 = "10.0.4.0/24"
private_cidr_block_2 = "10.0.5.0/24"
private_cidr_block_3 = "10.0.6.0/24"
availability_zone_1 = "ap-northeast-2a"
availability_zone_2 = "ap-northeast-2b"
availability_zone_3 = "ap-northeast-2c"

security_name = "allow_ssh"
ingress = {
    from_port = 22
    to_port = 22
}
protocol= "tcp"
cidr_blocks = [""] # 현재 본인의 IP

path_to_public_key = "" # 본인이 생성한 public key 이름
key_name = ""

region = "ap-northeast-2"
tags = {
    Terraform = "true"
    Enviroment = "dev"
}