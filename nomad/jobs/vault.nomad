# John Boero - jboero@hashicorp.com
# A job spec to install and run Vault with 'exec' driver - no Docker.
# Consul not used by default.  Add Consul to config template
# Artifact checksum is for linux-amd64 by default.
job "vault.service" {
  datacenters = ["dc1"]
  type = "service"
  group "vault" {
    count = 3

    task "vault.service" {
      driver = "exec"
      resources {
        cpu = 1000
        memory = 512
      }

      template {
        data        = <<EOF
        ui = true
        disable_mlock = true

        storage "consul" {
          address = "127.0.0.1:8500"
          path    = "vault"
        }

        listener "tcp" {
          address = ":8200"
          tls_disable = 1
        }
        EOF
        destination = "/etc/vault.d/vault.hcl"
      }
      config {
        command = "/usr/bin/vault"
        args = ["server", "-config=/etc/vault.d/vault.hcl"]
      }
    }
  }
}
