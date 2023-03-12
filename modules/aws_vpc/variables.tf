variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "vpc_tag" {
  type = string
  default = "VPC_1"
}
variable "IGW_tag" {
  type = string
  default = "IGW_1"
}
variable "RT_cidr" {
  type = string
  default = "0.0.0.0/0"
}
variable "RT_tag" {
  type = string
  default = "RT_1"
}
variable "subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}
variable "subnet_AZ" {
  type = string
  default =  "ap-south-1"
}
variable "subnet_tag" {
  type = string
  default = "Subnet_1"
}