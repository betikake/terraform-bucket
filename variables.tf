variable "location" {
  description = "The location of the Google Cloud Storage bucket."
  type        = string
}

variable "project_id" {
  
}

variable "bucket_name" {
  default = "betika-deployments-source"
  type    = string
}
variable "source_code" {}
variable "function_name" {}

variable "output_location" {
  description = "The directory containing the function output location."
  type        = string
}
