resource "opentelekomcloud_dns_zone_v2" "public_example_com" {
  name = "public.example.com."
  email = "public@example.com"
  description = "An example for public zone"
  ttl = 3000
  type = "public"
}

resource "opentelekomcloud_dns_zone_v2" "private_example_com" {
  name = "private.example.com."
  email = "private@example.com"
  description = "An example for private zone"
  ttl = 3000
  type = "private"
  router = {
     router_id = "${var.vpc_id}"
     router_region = "${var.region}"
  }
}


resource "opentelekomcloud_dns_recordset_v2" "rs_example_com" {
  zone_id = "${opentelekomcloud_dns_zone_v2.public_example_com.id}"
  name = "example.com."
  description = "An example record set"
  ttl = 3000
  type = "A"
  records = ["10.0.0.1"]
}
