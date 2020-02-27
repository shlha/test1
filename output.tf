output "instance_ips" {
  value = ["${aws_instance.test-shehr.*.public_ip}"]
}
