/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "bucket" {
  description = "Cloud storage bucket to import/export data from Cloud SQL."
  value       = module.gcs.name
}

output "connection_names" {
  description = "Connection name of each instance."
  value       = module.db.connection_names
}

output "demo_commands" {
  description = "Demo commands."
  value = {
    "01_ssh"             = "gcloud compute ssh ${module.test-vm.instance.name} --project ${module.project.name} --zone ${var.regions.primary}-b"
    "02_cloud_sql_proxy" = "cloud_sql_proxy -enable_iam_login -instances=${module.db.connection_name}=tcp:5432 &"
    "03_psql"            = "psql 'host=127.0.0.1 port=5432 sslmode=disable dbname=${var.postgres_database} user=postgres password=PASSWORD'"
  }
}

output "ips" {
  description = "IP address of each instance."
  value       = module.db.ips
}

output "project_id" {
  description = "ID of the project containing all the instances."
  value       = module.project.project_id
}

output "service_account" {
  description = "SQL client service Accounts."
  value       = module.service-account-sql.email
}
