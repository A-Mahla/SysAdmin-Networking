

# view ../p2/ for explanation
ip link add br0 type bridge
ip link set dev br0 up

# Unicast
ip link add name vxlan10 type vxlan id 10 dstport 4789
# Multicast
#ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789

ip link set dev vxlan10 up
brctl addif br0 eth0
brctl addif br0 vxlan10

vtysh << EOF
conf t

	hostname router_amahla-4
	no ipv6 forwarding
	!

	interface eth2
		/sbin/ip address 10.1.1.10/30
		/sbin/ip ospf area 0
	!

	interface lo
		/sbin/ip address 1.1.1.4/32
		/sbin/ip ospf area 0
	!

	router bgp 1
			neighbor 1.1.1.1 remote-as 1
			neighbor 1.1.1.1 update-source lo
		!
		address-family l2vpn evpn
			neighbor 1.1.1.1 activate
			advertise-all-vni
		exit-address-family
	!
	router ospf
!
EOF


