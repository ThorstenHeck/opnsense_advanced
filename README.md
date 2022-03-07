## Advanced opnsense example

This guide continues this repository https://github.com/ThorstenHeck/opnsense and will add ansible to the existing packer and terraform stack.

For an even more automated setup but with dependency to a chargeable SAAS Password Manager you can take a glance here:

https://github.com/ThorstenHeck/initialize-environment

## Introduction

In this advanced example we are going to setup a opensense firewall with two interfaces to communicate securely within the private Hetzner network. Furthermore we disable access to the public available WAN interface and only allow management on the local interface.  

To be able to connect via our WAN to our LAN we set up a OpenVPN Server and will end up with a valid .ovpn file, which then can used to create the VPN connection.  

### Setup

The creation part of opnsense will be the same as described in https://github.com/ThorstenHeck/opnsense so please stick to this until you have a manageable opnsense instance.  

After 

