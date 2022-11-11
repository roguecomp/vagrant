cluster_addr  = "https://192.168.56.20:8201"
api_addr      = "https://192.168.56.20:8200"

ui = true

storage "consul" {
  address = "192.168.56.10:8500"
  path    = "vault/"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1
}
