resource "google_storage_bucket_object" "default" {
  name   = "${var.function_name}-gcf-source/function-source.zip"
  bucket = var.bucket_name
  source = var.output_location
}

output "object_value" {
  value = google_storage_bucket_object.default
}

output "bucket_name" {
  value       = var.bucket_name
  description = "The name of the Google Cloud Storage bucket."
}

output "bucket_object" {
  value       = google_storage_bucket_object.default.name
  description = "The object path of the function source code in the Google Cloud Storage bucket."
}

output "crc32c" {
  value       = google_storage_bucket_object.default.md5hash
  description = "crc32c of the bucket"
}