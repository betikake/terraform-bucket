variable "location" {
  description = "The location of the Google Cloud Storage bucket."
  type        = string
}

variable "output_sha" {

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
