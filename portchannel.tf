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
resource "iosxe_rest" "acl_example_post" {
  method = "POST"
  path = "/data/Cisco-IOS-XE-native:native/ip/access-list"
  payload = jsonencode(
    {
      "Cisco-IOS-XE-acl:extended": [
          {
              "name": 102,
              "access-list-seq-rule": [
                  {
                      "sequence": "10",
                      "ace-rule": {
                          "action": "permit",
                          "protocol": "ip",
                          "host-address": "10.1.1.3",
                          "dst-any": [
                              null
                          ],
                          "precedence": "routine",
                          "tos": "normal",
                          "log": [
                              null
                          ]
                      }
                  },
                  {
                      "sequence": "20",
                      "ace-rule": {
                          "action": "permit",
                          "protocol": "tcp",
                          "any": [
                              null
                          ],
                          "dst-any": [
                              null
                          ],
                          "dst-eq": 600
                      }
                  },
                  {
                      "sequence": "30",
                      "ace-rule": {
                          "action": "permit",
                          "protocol": "udp",
                          "any": [
                              null
                          ],
                          "dst-any": [
                              null
                          ],
                          "dst-eq": 200
                      }
                  },
                  {
                      "sequence": "40",
                      "ace-rule": {
                          "action": "permit",
                          "protocol": "icmp",
                          "any": [
                              null
                          ],
                          "dst-any": [
                              null
                          ],
                          "dst-eq-port2": 250
                      }
                  },
                  {
                      "sequence": "50",
                      "ace-rule": {
                          "action": "permit",
                          "protocol": "igmp",
                          "any": [
                              null
                          ],
                          "dst-any": [
                              null
                          ],
                          "dst-eq-port2": 15
                      }
                  }
              ]
          }
      ]
  }
  )
}