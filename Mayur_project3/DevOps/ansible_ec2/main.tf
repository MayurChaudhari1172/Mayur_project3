module "ansible_control_node" {
  source                   = "../../Modules/AnsibleEC2/V0"
  ami_id                   = var.ami_id
  instance_type            = var.instance_type
  key_name                 = var.key_name
  subnet_id                = var.subnet_id
  security_group_id        = var.security_group_id
  iam_instance_profile     = var.iam_instance_profile
  instance_name            = "ansible-control-node"
  bootstrap_script_content = file(var.bootstrap_script_path)
}
