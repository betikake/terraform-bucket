variable "project_id" {}
variable "bucket_prefix_length" {}

resource "random_id" "bucket_prefix" {
  byte_length = var.bucket_prefix_length
}

resource "google_storage_bucket" "default" {
  name                        = "de${var.function_name}-gcf-source" # Every bucket name must be globally unique
  location                    = var.location
  uniform_bucket_level_access = true
  project                     = var.project_id
}


resource "google_storage_bucket_object" "default" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.default.name
  source = var.output_location
}


output "bucket_name" {
  value       = google_storage_bucket.default.name
  description = "The name of the Google Cloud Storage bucket."
}

output "bucket_object" {
  value       = google_storage_bucket_object.default.name
  description = "The object path of the function source code in the Google Cloud Storage bucket."
}