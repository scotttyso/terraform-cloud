variable "terraform_cloud_token" {
  description = "Token to Authenticate to the Terraform Cloud"
  type        = string
  sensitive   = true
}

variable "tfc_oath_token" {
  description = "Terraform Cloud OAuth Token for VCS_Repo Integration"
  type        = string
  sensitive   = true
}

variable "tfc_org_name" {
  description = "Terraform Cloud Organization Name"
  type        = string
}

variable "agent_pool" {
  description = "Terraform Cloud Agent Pool"
  type        = string
}

variable "apicPass" {
  type        = string
  sensitive   = true
  description = "APIC Password"
}

variable "api_key" {
  type        = string
  description = "API Key"
}

variable "secret_key" {
  sensitive   = true
  type        = string
  description = "Secret Key or file location"
}

variable "ssh_key" {
  type        = string
  description = "SSH Public Key to be used to node login."
}

variable "vc_password" {
  sensitive   = true
  type        = string
  description = "Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight."
}
