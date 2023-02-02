variable "project_id" {

  type        = string
  description = "Id do projeto de IaaS da GCP"

}

variable "region" {

  type        = string
  description = "estado ao qual há operações de data center."

}

variable "prefix" {

  default     = ["10.0.0.0/24"]
  type        = list(string)
  description = "prefixos de rede em uso no projeto."

}