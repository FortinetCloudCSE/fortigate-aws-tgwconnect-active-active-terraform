Content-Type: multipart/mixed; boundary="==Boundary=="
MIME-Version: 1.0

--==Boundary==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="config"

config system global
set hostname ${hostname}
set admintimeout 60
end
config system interface
edit port1
set vdom root
set alias public
set mode dhcp
set allowaccess ping https ssh http fgfm
set type physical
set mtu-override enable
set mtu 9001
next
edit port2
set alias private
set mode dhcp
set defaultgw disable
set allowaccess ping https ssh fgfm
set mtu-override enable
set mtu 9001
next
end

config router static
edit 1
set device port2
set dst ${vpc_cidr}
set dynamic-gateway enable
set comment vpc-route
next
edit 2
set device port2
set dst ${tgw_connect_cidr}
set dynamic-gateway enable
set comment tgw-connect-route
next
end

config system gre-tunnel
edit tgw-conn-peer
set interface port2
set remote-gw ${tgw_gre_address}
set local-gw ${fgt_port2_ip}
next
end
config system interface
edit tgw-conn-peer
set ip ${fgt_peer_address} 255.255.255.255
set allowaccess ping
set remote-ip ${tgw_peer_address1} 255.255.255.248
set interface port2
next
end

config router prefix-list
edit pflist-match-any
config rule
edit 1
set prefix any
unset ge
unset le
set action permit
next
end
end

config router route-map
edit rmap-aspath1
config rule
edit 1
set match-ip-address pflist-match-any
set set-aspath-action prepend
set set-aspath ${fgt_bgp_asn}
unset set-ip-nexthop
unset set-ip6-nexthop
unset set-ip6-nexthop-local
unset set-originator-id
next
end
next
edit rmap-aspath2
config rule
edit 1
set match-ip-address pflist-match-any
set set-aspath-action prepend
set set-aspath ${fgt_bgp_asn} ${fgt_bgp_asn}
unset set-ip-nexthop
unset set-ip6-nexthop
unset set-ip6-nexthop-local
unset set-originator-id
next
end
next
end

config router bgp
set as ${fgt_bgp_asn}
set router-id ${fgt_port2_ip}
set ebgp-multipath enable
config neighbor
edit ${tgw_peer_address1}
set ebgp-enforce-multihop enable
set ebgp-multihop-ttl 2
set remote-as ${tgw_bgp_asn}
set route-map-out rmap-aspath1
set capability-default-originate enable
set default-originate-routemap rmap-aspath1
set advertisement-interval 1
set keep-alive-timer 3
set holdtime-timer 9
set connect-timer 9
set soft-reconfiguration enable
next
edit ${tgw_peer_address2}
set ebgp-enforce-multihop enable
set ebgp-multihop-ttl 2
set remote-as ${tgw_bgp_asn}
set route-map-out rmap-aspath1
set capability-default-originate enable
set default-originate-routemap rmap-aspath1
set advertisement-interval 1
set keep-alive-timer 3
set holdtime-timer 9
set connect-timer 9
set soft-reconfiguration enable
next
end
end

config firewall policy
edit 1
set name "egress_access"
set srcintf "tgw-conn-peer"
set dstintf "port1"
set srcaddr "all"
set dstaddr "all"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
set nat enable
next
edit 2
set name "east-west_access"
set srcintf "tgw-conn-peer"
set dstintf "tgw-conn-peer"
set srcaddr "all"
set dstaddr "all"
set action accept
set schedule "always"
set service "ALL"
set logtraffic all
next
end

config system sdn-connector
edit "aws-instance-role"
set status enable
set type aws
set use-metadata-iam enable
set alt-resource-ip enable
next
end

config system ha
set session-pickup enable
set session-pickup-connectionless enable
set session-pickup-expectation enable
set session-pickup-nat enable
set override disable
end
config system standalone-cluster
set group-member-id ${fgsp_member_id}
config cluster-peer
edit 1
set peerip ${fgsp_peer_ip}
set syncvd root
next
end
end

%{ if license_type == "byol" }
--==Boundary==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="license"

${file(license_file)}
%{ endif }
%{ if license_type == "flex" }
--==Boundary==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="license"

LICENSE-TOKEN: ${license_token}
%{ endif }
--==Boundary==--