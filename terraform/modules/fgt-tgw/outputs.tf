output "fgt1_id" {
  value = aws_instance.fgt1.id
}

output "fgt2_id" {
  value = aws_instance.fgt2.id
}

output "fgt1_private_ip" {
  value = aws_network_interface.fgt1_eni1.private_ip
}

output "fgt2_private_ip" {
  value = aws_network_interface.fgt2_eni1.private_ip
}

output "fgt1_eip" {
  value = aws_eip.fgt1_eip.public_ip
}

output "fgt2_eip" {
  value = aws_eip.fgt2_eip.public_ip
}
