variable "project_id" {}

resource "random_id" "bucket_prefix" {
  byte_length = var.bucket_prefix_length
}

/*resource "google_storage_bucket" "default" {
  name                        = "betika-deployments-source/${var.function_name}-gcf-source" # Every bucket name must be globally unique
  location                    = var.location
  uniform_bucket_level_access = true
  project                     = var.project_id
}*/


resource "google_storage_bucket_object" "default" {
  name   = "${var.function_name}-gcf-source/function-source-${random_id.bucket_prefix.hex}.zip"
  bucket = var.bucket_name
  source = var.output_location
}


output "bucket_name" {
  value       = var.bucket_name
  description = "The name of the Google Cloud Storage bucket."
}

output "bucket_object" {
  value       = google_storage_bucket_object.default.name
  description = "The object path of the function source code in the Google Cloud Storage bucket."
}