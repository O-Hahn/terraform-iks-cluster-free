
variable "zone" {}
variable "kube_cluster_name" {}
variable "resource_group_name" {}
variable "data_center" {}

data "ibm_resource_group" "default_rg" {
  name = var.resource_group_name
}

resource ibm_container_cluster "fhwien-cluster" {
    name            = var.kube_cluster_name
    datacenter      = var.data_center
    machine_type    = "free"
    hardware        = "shared"
    #public_vlan_id  = "vlan"
    #private_vlan_id = "vlan"

    kube_version = "1.24.9"

    default_pool_size = 1
        
    #public_service_endpoint  = "true"
    #private_service_endpoint = "true"

    resource_group_id = data.ibm_resource_group.default_rg.id
    #gateway_enabled = true

    labels = {
        "test" = "test-pool"
    }
}