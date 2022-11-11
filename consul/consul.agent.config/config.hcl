server = false
datacenter = "ap-southeast"

data_dir = "/opt/consul"
log_level = "INFO"
enable_syslog = true
bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"192.168.56.0/21\" | attr \"address\" }}"
start_join = ["192.168.56.10", "192.168.56.11", "192.168.56.12"]
