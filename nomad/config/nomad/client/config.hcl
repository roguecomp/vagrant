datacenter = "dc1"

# data_dir tends to be environment specific.
data_dir = "/opt/nomad/data"
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"192.168.56.0/21\" | attr \"address\" }}"

client {
  enabled = true
}
