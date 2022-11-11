# /etc/nomad.d/server.hcl

# data_dir tends to be environment specific.
data_dir = "/opt/nomad/data"
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"192.168.56.0/21\" | attr \"address\" }}"

server {
  enabled          = true
  bootstrap_expect = 3

  server_join {
    retry_join = ["192.168.56.20:4648"]
  }

}
