bootstrap_expect = 3
datacenter= "ap-southeast"
data_dir= "/opt/consul"

verify_server_hostname=false

#enable_script_checks= true
#dns_config {
#    enable_truncate = true
#    only_passing = true
#}

enable_syslog = true
leave_on_terminate = true
log_level = "INFO"
rejoin_after_leave = true
server = true
#start_join = [
#    "192.168.56.10",
#    "192.168.56.11",
#    "192.168.56.12"
#]

retry_join = [
    "192.168.56.10",
]

bind_addr = "{{ GetPrivateInterfaces | include \"network\" \"192.168.56.0/21\" | attr \"address\" }}"
client_addr = "{{ GetPrivateInterfaces | include \"network\" \"192.168.56.0/21\" | attr \"address\" }}"

ui = true
