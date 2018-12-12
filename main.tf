
# Setup provider
provider "hcloud" {
  token = "${var.token}"
}

# Create ssh public key for server access
resource "hcloud_ssh_key" "pubkey" {
  name = "${var.name}"
  public_key = "${var.ssh_key}"
}

# Create master server
resource "hcloud_server" "master" {
  name = "${var.name}-master-${count.index+1}"
  image = "${var.image}"
  server_type = "${var.master_instance_type}"
  keep_disk = "${var.keep_disk}"
  ssh_keys = [ "${hcloud_ssh_key.pubkey.id}" ]
  user_data = "${var.cloud_init}"

  count = "${var.master_count}"
}

# Create worker servers
resource "hcloud_server" "worker" {
  name = "${var.name}-worker-${count.index+1}"
  image = "${var.image}"
  server_type = "${var.worker_instance_type}"
  keep_disk = "${var.keep_disk}"
  ssh_keys = [ "${hcloud_ssh_key.pubkey.id}" ]
  user_data = "${var.cloud_init}"
  
  count = "${var.worker_count}"
}

