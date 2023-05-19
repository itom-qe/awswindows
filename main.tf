resource "aws_instance" "basic_vm" {
  ami           = var.ami
  instance_type = var.instancetype
  key_name      = var.keyname
  subnet_id	= var.subnet
  get_password_data = "true"
}

output "password" {
  value = "${rsadecrypt(aws_instance.basic_vm.password_data, file("${var.keypath}"))}"
}
