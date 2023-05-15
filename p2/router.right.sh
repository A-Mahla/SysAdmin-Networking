

# create link called br0 on type bridge
ip link add br0 type bridge
# up the device created (br0)
ip link set dev br0 up
# add host ip to routing table of the router
ip addr add 10.1.1.2/30 dev eth0

# set Vxlan dev and encapsulation
# Unicast
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.1 local 10.1.1.2 dstport 4789

# Multicast
ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789

# add router ip to vxlan routing table (after encapsulation)
ip addr add 20.1.1.2/30 dev vxlan10

# up the device vxlan10 / cmd : ip -d link show vxlan10
ip link set dev vxlan10 up

# brctl (bridge control) for host, add interfaces eth1 to the bridge set above
# and to the vxlan10
brctl addif br0 eth1
brctl addif br0 vxlan10
