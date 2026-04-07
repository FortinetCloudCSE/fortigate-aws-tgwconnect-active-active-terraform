output "fgt_login_info" {
  value = <<-FGTLOGIN
-=-=-=-=-=-=-=-=-=-=-
fgt username: admin
fgt1 initial password: ${module.fgt-tgw.fgt1_id}
fgt2 initial password: ${module.fgt-tgw.fgt2_id}
fgt1 login url: https://${module.fgt-tgw.fgt1_eip}
fgt2 login url: https://${module.fgt-tgw.fgt2_eip}
-=-=-=-=-=-=-=-=-=-=-
FGTLOGIN
}

output "tgw_info" {
  value = var.create_tgw ? (
    <<-tgwNEW
-=-=-=-=-=-=-=-=-=-=-
tgw id: ${module.transit-gw[0].tgw_id}
tgw spoke route table id: ${module.transit-gw[0].tgw_spoke_route_table_id}
tgw security route table id: ${module.transit-gw[0].tgw_security_route_table_id}
-=-=-=-=-=-=-=-=-=-=-
tgwNEW
    ) : (
    <<-tgwEXISTING
-=-=-=-=-=-=-=-=-=-=-
tgw_id = var.existing_tgw_id
tgw_spoke_route_table_id = var.existing_tgw_spoke_route_table_id
tgw_security_route_table_id = var.existing_tgw_security_route_table_id
-=-=-=-=-=-=-=-=-=-=-
tgwEXISTING
  )
}