cd %SystemRoot%\system32\WindowsPowerShell\v1.0\
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process powershell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""C:\Users\adm.anthony.spiteri\Documents\Terraform\Configure-vCD-VCCR-NSX-ESG_Zettagrid\configure_vCD_VCCR_NSX_Edge.ps1""' -Verb RunAs}"
