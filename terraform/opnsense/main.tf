resource "hcloud_server" "server" {
  name        = "opnsense"
  server_type = "cx11"
  image       = data.hcloud_image.image.id
  location    = "nbg1"
  ssh_keys    = [data.hcloud_ssh_key.ssh-key.name]
  keep_disk   = true

  connection {
    type     = "ssh"
    user     = data.hcloud_ssh_key.ssh-key.name
    password = var.OPNSENSE_USER_PASSWORD
    host     = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${var.OPNSENSE_USER_PASSWORD} | sudo -S reboot -r",
    ]
  }
}


data "hcloud_ssh_key" "ssh-key" {
  name = "${var.SSH_KEY}"
}

data "hcloud_image" "image" {
  with_selector = "name=${var.IMAGE}"
  most_recent = true
}

provider "hcloud" {
  token = var.HCLOUD_TOKEN
}

locals {
  public_ip = join("", hcloud_server.server.*.ipv4_address)
}
output "WAN_Interface_Public" {
  value = "${local.public_ip}"
}

terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.32.2"
    }
  }
  required_version = ">= 0.14"
}