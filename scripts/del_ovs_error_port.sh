for i in `ovs-vsctl show | grep error | awk {'print $7'}`;do ovs-vsctl del-port $i;done
