/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "scheduler_job_id" {
  value       = module.autoscaler-scheduler.scheduler_job_id
  description = "ID of the Scheduler job"
}

output "memorystore_discovery_endpoint" {
  value       = module.autoscaler-memorystore-cluster.memorystore_discovery_endpoint != null ? module.autoscaler-memorystore-cluster.memorystore_discovery_endpoint.address : null
  description = "Memorystore discovery endpoint (currently single value)"
}

output "test_vm_zone" {
  value       = length(module.autoscaler-test-vm) > 0 ? one(module.autoscaler-test-vm).zone : null
  description = "Zone of the test VM"
}

output "test_vm_name" {
  value       = length(module.autoscaler-test-vm) > 0 ? one(module.autoscaler-test-vm).instance_name : null
  description = "Name of the test VM"
}
