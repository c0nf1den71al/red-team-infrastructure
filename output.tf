output "table" {
  sensitive = true
  value     = <<EOT
====================== VPN Server =======================
Connection:       Tailscale

Public IP:        ${aws_instance.vpn.public_ip}
Private IP:       ${aws_instance.vpn.private_ip}

===================== Elastic Stack =====================
Access:           http://${aws_instance.elk.private_ip}:5601/
Username:         elastic
Password:         ${random_password.elastic_password.result}

Public IP:        N/A
Private IP:       ${aws_instance.elk.private_ip}

==================== Short C2 Server ====================
Access:           /output/sliver-profiles/*

Public IP:        N/A
Private IP:       ${aws_instance.short_c2.private_ip}

================== Short C2 Redirector ==================
Forward Domain:   http://example.com
Redirect Path:    /assets/en-gb/*

Public IP:        ${aws_instance.short_redirector.public_ip}
Private IP:       ${aws_instance.short_redirector.private_ip}
EOT
}
