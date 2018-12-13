# terraform-module-k8s-hetzner-core
Core machine setup for k8s cluster on Hetzner Cloud

Module Input Variables
----------------------

- `token` - Access token for Hetzner Cloud.
- `ssh-key` - Public SSH key for root account access.
- `name` - Common naame for created servers (prefix).
- `master_instance_type` - (optional) Hetzner cloud instance type for master nodes, defaults to cx11.
- `worker_instance_type` - (optional) Hetzner cloud instance type for worker nodes, defaults to cx11.
- `master_count` - (optional) Number of master nodes, defaults to 1.
- `worker_count` - (optional) Number of worker nodes, defaults to 2.
- `image` - (optional) System image to use, defaults to ubuntu-18.04.
- `keep_disk` - (optional) If true, do not upgrade the disk. This allows downgrading the server type later, defaults to true.

Usage
-----

```hcl
module "k8s" {
  source = "git@github.com/meloos/terraform-module-k8s-hetzner-core.git"

  token = "<hcloud_token>"
  name = "k8s"
  ssh_key = "${file("~/.ssh/id_rsa.pub")}"

}
```
