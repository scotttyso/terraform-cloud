variable "terraform_cloud_token" {
  description = "Token to Authenticate to the Terraform Cloud"
  sensitive   = true
  type        = string
}

variable "tfc_oath_token" {
  description = "Terraform Cloud OAuth Token for VCS_Repo Integration"
  sensitive   = true
  type        = string
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
  description = "APIC Password"
  sensitive   = true
  type        = string
}

variable "api_key" {
  description = "API Key"
  sensitive   = true
  type        = string
}

variable "secret_key" {
  description = "Secret Key or file location"
  sensitive   = true
  type        = string
}

variable "ssh_key" {
  description = "SSH Public Key to be used to node login."
  sensitive   = true
  type        = string
}

variable "vc_password" {
  description = "Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight."
  sensitive   = true
  type        = string
}
