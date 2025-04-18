```
$pip = Get-AzPublicIpAddress -Name "server1-ip" -ResourceGroupName "MyResourceGroup"
$pip.DnsSettings.ReverseFqdn = "yourdomain.com"
Set-AzPublicIpAddress -PublicIpAddress $pip
```
