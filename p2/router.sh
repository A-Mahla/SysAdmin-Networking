
# First link interfaces inside the router (bridge)

# create link called br0 on type bridge
ip link add br0 type bridge
# up the device created (br0)
ip link set dev br0 up
# set Ip addr for incoming packages
ip addr add 10.1.1.1/30 dev eth0

# set Vxlan dev and encapsulation
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.2 local 10.1.1.1 dstport 4789
# set ip addr for outgoing package (after encapsulation)
ip addr add 20.1.1.1/24 dev vxlan10


