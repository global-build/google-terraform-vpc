
locals {
  subnet_01 = "${var.network_name}-subnet-01"
  subnet_02 = "${var.network_name}-subnet-02"
  subnet_03 = "${var.network_name}-subnet-03"
  subnet_04 = "${var.network_name}-subnet-04"
}

module "vpc" {
  source = "../"

  project_id   = "ops-trisha-fernandes"
  network_name = "test"
  subnets = [
    {
      subnet_name   = "${local.subnet_01}"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name           = "${local.subnet_02}"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-west1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name               = "${local.subnet_03}"
      subnet_ip                 = "10.10.30.0/24"
      subnet_region             = "us-west1"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_15_MIN"
      subnet_flow_logs_sampling = 0.9
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    },
    {
      subnet_name   = "${local.subnet_04}"
      subnet_ip     = "10.10.40.0/24"
      subnet_region = "us-west1"
    },
  ]

  secondary_ranges = {
    "${local.subnet_01}" = [
      {
        range_name    = "${local.subnet_01}-01"
        ip_cidr_range = "192.168.64.0/24"
      },
      {
        range_name    = "${local.subnet_01}-02"
        ip_cidr_range = "192.168.65.0/24"
      },
    ]

    "${local.subnet_02}" = []

    "${local.subnet_03}" = [
      {
        range_name    = "${local.subnet_03}-01"
        ip_cidr_range = "192.168.66.0/24"
      },
    ]
  }
}