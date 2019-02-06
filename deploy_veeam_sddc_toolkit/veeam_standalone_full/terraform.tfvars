
# vCenter FQDN or IP to which the systems will be deployed.
vsphere_server         = "VCENTER"

# vCenter Username with privileges to deploy machines
vsphere_user           = "administrator@vsphere.local"

# vCenter Password of User selected
vsphere_password       = "PASSWORD"

# vSphere Datacenter Name to which the systems will be deployed.
datacenter             = "VC03"

# vSphere Cluster or Resource Pool to which the systems will be deployed.
vsphere_resource_pool  = "TPM03-AS"

# vSphere Virtual Machine Network to which the systems will be attached.
vsphere_network_name   = "TPM03-730"

# vSphere Full Template Path from which the systems will be deployed.  Must include any vSphere folder names e.g Templates/windows_2016
veeam_template_path    = "TPM03-AS/TPM03-WIN2016-TEMPLATE"

# Total number of vCPUs to assign to Veeam VBR Server
vbr_cpu_count          =  2

# Total amount of memory (MB) to assign to Veeam VBR Server
vbr_memory_size_mb     = 8192

# [Optional] vSphere Full Template Path from which the Proxy systems will be deployed.  If empty or 'same' then the variable veeam_template_path will be used.
proxy_template_path    = "same"

# Total number of vCPUs to assign to Veeam Proxy Server
proxy_cpu_count        = 2

# Total amount of memory (MB) to assign to Veeam Proxy Server
proxy_memory_size_mb   = 8192

# Should the Veeam Proxy Server be registered to the Veeam VBR Server.
# If false then the proxy server will not register.  This is handy for creating fast launch templates.
should_register_proxy  = true

# vSphere Folder to which the systems will be deployed.  Must exist prior to execution.
veeam_deployment_folder= "TPM03-AS"

# Username for Remote Windows Management Connections.  Must be in Domain\\username or username (for local accounts) format.
vbr_admin_user             = "USERNAME"

# Password for Remote Windows Management Connections
vbr_admin_password         = "PASSWORD"

# Username for Remote Windows Management Connections.  Must be in Domain\\username or username (for local accounts) format.
proxy_admin_user       = "USERNAME"

# Password for Remote Windows Management Connections
proxy_admin_password   = "PASSWORD"

# FQDN domain name
domain_name            = "DOMAIN"

# Enter the hostname to give to the Veeam Backup and Replication Server.  Should be less than 16 characters.
veeam_server_name      = "SDDC-VBR-01"

# Enter the hostname prefix to give to the Veeam Proxy Server.  Must be less than 12 characters as proxies will receive a 3 digit identifier at the end of their name.
veeam_proxy_name       = "SDDC-VPR-01"

# Number of Proxy Servers to create.  Zero will remove all proxies created by this Terraform State.
proxy_count            = 0


# Chef Configuration

# Full URL from which the Veeam software will be downloaded.
veeam_installation_url = "https://download.veeam.com/VeeamBackup&Replication_9.5.4.2615.Update4.iso"

# SHA256 Checksum for the ISO Url selected.
veeam_installation_checksum = "8a594cec74059f9929ea765ac5e70a49da6fc93803b567cbb9d74fbb1a49a6cc"

# Veeam License File.
license_base64_encoded = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPExpY2Vuc2VzPjxMaWNlbnNlPjwhW0NEQVRBW0NQVSBzb2NrZXRzIChIeXBlci1WKT0wCkNQVSBzb2NrZXRzICh2U3BoZXJlKT0xMDAKQ29tcGFueT1WZWVhbSBTb2Z0d2FyZQpEZXNjcmlwdGlvbj1Db3B5cmlnaHQgMjAxOCBWZWVhbSwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLiBUaGUgU29mdHdhcmUgUHJvZHVjdCBpcyBwcm90ZWN0ZWQgYnkgY29weXJpZ2h0IGFuZCBvdGhlciBpbnRlbGxlY3R1YWwgcHJvcGVydHkgbGF3cyBhbmQgdHJlYXRpZXMuIFZlZWFtIG9yIGl0cyBzdXBwbGllcnMgb3duIHRoZSB0aXRsZSwgY29weXJpZ2h0LCBhbmQgb3RoZXIgaW50ZWxsZWN0dWFsIHByb3BlcnR5IHJpZ2h0cyBpbiB0aGUgU29mdHdhcmUgUHJvZHVjdC4gVmVlYW0gcmVzZXJ2ZXMgYWxsIHJpZ2h0cyBub3QgZXhwcmVzc2x5IGdyYW50ZWQgdG8geW91IGluIEVVTEEuIFRoZSBTb2Z0d2FyZSBQcm9kdWN0IGlzIGxpY2Vuc2VkLCBub3Qgc29sZC4gVmVlYW0gZ3JhbnRzIHRvIHlvdSBhIG5vbmV4Y2x1c2l2ZSBub250cmFuc2ZlcmFibGUgbGljZW5zZSB0byB1c2UgdGhlIFNvZnR3YXJlIFByb2R1Y3QsIHByb3ZpZGVkIHRoYXQgeW91IGFncmVlIHdpdGggRVVMQS4KRS1tYWlsPWFudGhvbnkuc3BpdGVyaUB2ZWVhbS5jb20KRWRpdGlvbj1FbnRlcnByaXNlIFBsdXMKRXhwaXJhdGlvbiBkYXRlPTI4LzAzLzIwMTkKRmlyc3QgbmFtZT1WZWVhbQpMYXN0IG5hbWU9UHJvZHVjdCBTdHJhdGVneQpMaWNlbnNlIGluZm9ybWF0aW9uPUxpY2Vuc2UgdHlwZTpcdE5GUiBMaWNlbnNlXG5MaWNlbnNlZCB0bzpcdFZlZWFtIFNvZnR3YXJlXG5Db250YWN0IHBlcnNvbjpcdFZlZWFtIFByb2R1Y3QgU3RyYXRlZ3lcbkNQVSBzb2NrZXRzICh2U3BoZXJlKTpcdDEwMFxuRWRpdGlvbjogICAgICAgXHRFbnRlcnByaXNlIFBsdXMKTGljZW5zZSB0eXBlPU5GUiBMaWNlbnNlClByb2R1Y3Q9VmVlYW0gQmFja3VwIGFuZCBSZXBsaWNhdGlvbgpTdXBwb3J0IGV4cGlyYXRpb24gZGF0ZT0yOC8wMy8yMDE5ClZlcnNpb249OS54ClNpZ25hdHVyZT1BN0NEQTcyRTkyOENGRjU4Qjg0RDc2RUZGQjA5MTcyRTU1RDNFQzlFNUQwMDk2QkIwOTg5ODMyRUEwNjAxRDdEMTMxM0Y1MzgzRTE4MTcyOEZENUExN0NDOTg2QTE5NkE4RTUyMEVDQzdDQUI1NDYzRjFFQTVFODdDMzY2RDRGODdDQTBCODgwNTQ5OTE4NEFEMDJBRTdCM0Q2NzdFNTU4MjY4QTIxNTc2ODBFNzk1NDI2NzEzNUM3MjdEMjM3N0FBRkUyMUY3RjQ2NUU1NEYxQjJDMTkyMkFDMjA5MzU2NEZGODNBNjA2Rjc1M0JCMERFM0VEQzc5MDlEQTBDMTMwCl1dPjwvTGljZW5zZT48L0xpY2Vuc2VzPg"








