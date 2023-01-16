terraform {
    required_providers {
        iosxe = {
        version = "0.1.1"
        source  = "CiscoDevNet/iosxe"
        }
    }
}
provider "iosxe" {
  // Required but Optional if env variable are set
  host = "https://10.103.8.45"
  insecure = true
  device_username = "admin"
  device_password = "admin"
  request_timeout = 30
  }
resource "iosxe_rest" "acl_example_delete" {
  method = "DELETE"
  path = "/data/Cisco-IOS-XE-native:native/ip/access-list/extended=102"
}
