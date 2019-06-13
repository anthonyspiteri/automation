# vccr_vcd_configure_nsx_edge

## Distributed under MIT license
Copyright (c) 2018 VeeamHub
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Author: Anthony Spiteri

Description: Post Script that can be run after completion of Veeam vCloud Director Cloud Connect Replication Job that automatically configures the NSX Edge to allow external network connectivity for replicas in the case of full failover.

Function: Using the Terraform vCloud Director Provider to automate NAT and Firewall rules for specific subnets and VM IP addresses for service access. Code can easily be expanded for configuration of additional Replica VMs and networking configuration.

* Firewall Rules for HTTP, HTTPS, SSH and ICMP for vOrg Network Subnet
* NAT Rules for inbound HTTP, HTTP, SSH to VM IP 
* NAT rule for outbound access for vORG Network Subnet

Pre-Requisites: There are a few requirements and pre-requisites that need to be in place before adding the script to the Veeam Replication Job which launches the Terraform plan.

* Download Terraform executable and place into working folder
* vOrg Network needs to be previously created in vCloud Director on NSX Edge
* Reccomended to create a seperate vCloud Director Org user to action API calls

Variables: There are some variables that can be adjustment or need specifying.

All variables are in the terraform.tfvars file

    vcd_user = "apiuser"
    vcd_pass = "password"
    vcd_org = "ORG Name"
    vcd_url = "https://vcloud/api"
    vcd_vdc = "vCD Name"
    vcd_edge ="NSX Edge Name"
    vcd_external_ip="NSX Edge External IP"
    vcd_vm_1="Replica VM IP"
    vcd_vorg_network="vORG Network subnet and mask"

* In the run_vCD_VCCR_NSX_Edge_Powershell_.bat file, which is what is executed by the Veeam Replication Job the path to the configure_vCD_VCCR_NSX_Edge.ps1 needs to be modified to it's full location

Usage: ./terraform plan|apply|destory

eg. echo yes | ./terraform apply
