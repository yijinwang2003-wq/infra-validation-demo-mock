package infra

deny[msg] {
  some i
  input.resource_changes[i].type == "aws_security_group"

  some j
  input.resource_changes[i].change.after.ingress[j].from_port == 22
  input.resource_changes[i].change.after.ingress[j].to_port == 22

  input.resource_changes[i].change.after.ingress[j].cidr_blocks[_] == "0.0.0.0/0"

  msg := "Security group must not allow SSH (22) from 0.0.0.0/0"
}