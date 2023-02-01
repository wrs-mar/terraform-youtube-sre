variable "project_id" {

  type        = string
  description = "Id do projeto de IaaS da GCP"

}

variable "gcp_auth_file" {

  type        = string
  description = "conta de serviço."

}

variable "region" {

  type=string
  description = "estado ao qual há operações de data center."

}

variable "main_zone" {

  type=string
  description = "cidade onde está localizado o data center."

}