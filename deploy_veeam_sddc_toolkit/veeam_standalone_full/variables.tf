
variable "vsphere_server" {
  type        = "string"
  description = "vCenter FQDN or IP to which the systems will be deployed."
}

variable "vsphere_user" {
  type        = "string"
  description = "vCenter Username with privileges to deploy machines"
}

variable "vsphere_password" {
  type        = "string"
  description = "vCenter Password of User selected"
}

variable "datacenter" {
  type        = "string"
  description = "vSphere Datacenter Name to which the systems will be deployed."
}

variable "vsphere_resource_pool" {
  type        = "string"
  description = "vSphere Cluster or Resource Pool to which the systems will be deployed."
}

variable "vsphere_network_name" {
  type        = "string"
  description = "vSphere Virtual Machine Network to which the systems will be attached."
}

variable "veeam_template_path" {
  type        = "string"
  description = "vSphere Full Template Path from which the systems will be deployed.  Must include any vSphere folder names e.g Templates/windows_2016"
}

variable "vbr_cpu_count" {
  type        = "string"
  description = "Total number of vCPUs to assign to Veeam VBR Server"
  default     = 2
}

variable "vbr_memory_size_mb" {
  type        = "string"
  description = "Total amount of memory (MB) to assign to Veeam VBR Server"
  default     = 4096
}

variable "proxy_template_path" {
  type        = "string"
  description = "[Optional] vSphere Full Template Path from which the Proxy systems will be deployed.  If empty or 'same' then the variable veeam_template_path will be used."
  default     = "same"
}

variable "proxy_cpu_count" {
  type        = "string"
  description = "Total number of vCPUs to assign to Veeam Proxy Server"
  default     = 2
}

variable "proxy_memory_size_mb" {
  type        = "string"
  description = "Total amount of memory (MB) to assign to Veeam Proxy Server."
  default     = 2048
}

variable "should_register_proxy" {
  type        = "string"
  description = "Should the Veeam Proxy Server be registered to the Veeam VBR Server. If false then the proxy server will not register.  This is handy for creating fast launch templates."
  default     = "true"
}

variable "veeam_deployment_folder" {
  type        = "string"
  description = "vSphere Folder to which the systems will be deployed.  Must exist prior to execution."
}

variable "vbr_admin_user" {
  type        = "string"
  description = "Username for Remote Windows Management Connections.  Must be in Domain\\username or username (for local accounts) format."
}

variable "vbr_admin_password" {
  type        = "string"
  description = "Password for Remote Windows Management Connections"
}

variable "proxy_admin_user" {
  type        = "string"
  description = "Username for Remote Windows Management Connections.  Must be in Domain\\username or username (for local accounts) format."
}

variable "proxy_admin_password" {
  type        = "string"
  description = "Password for Remote Windows Management Connections"
}

variable "domain_name" {
  type        = "string"
  description = "FQDN domain name"
}

variable "veeam_server_name" {
  type        = "string"
  description = "Enter the hostname to give to the Veeam Backup and Replication Server.  Should be less than 16 characters."
  default     = "veeam"
}

variable "veeam_proxy_name" {
  type        = "string"
  description = "Enter the hostname prefix to give to the Veeam Proxy Server.  Must be less than 12 characters as proxies will receive a 3 digit identifier at the end of their name."
  default     = "proxy"
}

variable "proxy_count" {
  type        = "string"
  description = "Number of Proxy Servers to create.  Zero will remove all proxies created by this Terraform State"
  default     = 0
}


# Chef Configuration

variable "veeam_installation_url" {
  type        = "string"
  description = "Full URL from which the Veeam software will be downloaded."
  default     = "https://download.veeam.com/VeeamBackup&Replication_9.5.4.2615.Update4.iso"
}

variable "veeam_installation_checksum" {
  type        = "string"
  description = "SHA256 Checksum for the ISO Url selected."
  default     = "8a594cec74059f9929ea765ac5e70a49da6fc93803b567cbb9d74fbb1a49a6cc"
}

variable "license_base64_encoded" {
  type        = "string"
  description = "Base64 Encoded License File"
  default     = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPExpY2Vuc2VzPjxMaWNlbnNlPjwhW0NEQVRBW0NQVSBzb2NrZXRzIChIeXBlci1WKT0wCkNQVSBzb2NrZXRzICh2U3BoZXJlKT0xMDAKQ29tcGFueT1WZWVhbSBTb2Z0d2FyZQpEZXNjcmlwdGlvbj1Db3B5cmlnaHQgMjAxOCBWZWVhbSwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLiBUaGUgU29mdHdhcmUgUHJvZHVjdCBpcyBwcm90ZWN0ZWQgYnkgY29weXJpZ2h0IGFuZCBvdGhlciBpbnRlbGxlY3R1YWwgcHJvcGVydHkgbGF3cyBhbmQgdHJlYXRpZXMuIFZlZWFtIG9yIGl0cyBzdXBwbGllcnMgb3duIHRoZSB0aXRsZSwgY29weXJpZ2h0LCBhbmQgb3RoZXIgaW50ZWxsZWN0dWFsIHByb3BlcnR5IHJpZ2h0cyBpbiB0aGUgU29mdHdhcmUgUHJvZHVjdC4gVmVlYW0gcmVzZXJ2ZXMgYWxsIHJpZ2h0cyBub3QgZXhwcmVzc2x5IGdyYW50ZWQgdG8geW91IGluIEVVTEEuIFRoZSBTb2Z0d2FyZSBQcm9kdWN0IGlzIGxpY2Vuc2VkLCBub3Qgc29sZC4gVmVlYW0gZ3JhbnRzIHRvIHlvdSBhIG5vbmV4Y2x1c2l2ZSBub250cmFuc2ZlcmFibGUgbGljZW5zZSB0byB1c2UgdGhlIFNvZnR3YXJlIFByb2R1Y3QsIHByb3ZpZGVkIHRoYXQgeW91IGFncmVlIHdpdGggRVVMQS4KRS1tYWlsPWFudGhvbnkuc3BpdGVyaUB2ZWVhbS5jb20KRWRpdGlvbj1FbnRlcnByaXNlIFBsdXMKRXhwaXJhdGlvbiBkYXRlPTI4LzAzLzIwMTkKRmlyc3QgbmFtZT1WZWVhbQpMYXN0IG5hbWU9UHJvZHVjdCBTdHJhdGVneQpMaWNlbnNlIGluZm9ybWF0aW9uPUxpY2Vuc2UgdHlwZTpcdE5GUiBMaWNlbnNlXG5MaWNlbnNlZCB0bzpcdFZlZWFtIFNvZnR3YXJlXG5Db250YWN0IHBlcnNvbjpcdFZlZWFtIFByb2R1Y3QgU3RyYXRlZ3lcbkNQVSBzb2NrZXRzICh2U3BoZXJlKTpcdDEwMFxuRWRpdGlvbjogICAgICAgXHRFbnRlcnByaXNlIFBsdXMKTGljZW5zZSB0eXBlPU5GUiBMaWNlbnNlClByb2R1Y3Q9VmVlYW0gQmFja3VwIGFuZCBSZXBsaWNhdGlvbgpTdXBwb3J0IGV4cGlyYXRpb24gZGF0ZT0yOC8wMy8yMDE5ClZlcnNpb249OS54ClNpZ25hdHVyZT1BN0NEQTcyRTkyOENGRjU4Qjg0RDc2RUZGQjA5MTcyRTU1RDNFQzlFNUQwMDk2QkIwOTg5ODMyRUEwNjAxRDdEMTMxM0Y1MzgzRTE4MTcyOEZENUExN0NDOTg2QTE5NkE4RTUyMEVDQzdDQUI1NDYzRjFFQTVFODdDMzY2RDRGODdDQTBCODgwNTQ5OTE4NEFEMDJBRTdCM0Q2NzdFNTU4MjY4QTIxNTc2ODBFNzk1NDI2NzEzNUM3MjdEMjM3N0FBRkUyMUY3RjQ2NUU1NEYxQjJDMTkyMkFDMjA5MzU2NEZGODNBNjA2Rjc1M0JCMERFM0VEQzc5MDlEQTBDMTMwCl1dPjwvTGljZW5zZT48L0xpY2Vuc2VzPg"
}





