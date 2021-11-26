output "k8s_masters" {
  value = [
    for key, item in aws_instance.k8s_master :
    "Name: ${item.tags.Name} | PrivateIP: ${item.private_ip} | PublicIP: ${item.public_ip} ==> ssh -i '~/.ssh/keyPvtAccess.pub' ubuntu@${item.private_ip}"
  ]
}

output "k8s_workers" {
  value = [
    for key, item in aws_instance.k8s_worker :
    "Name: ${item.tags.Name} | PrivateIP: ${item.private_ip} | PublicIP: ${item.public_ip} ==> ssh -i '~/.ssh/keyPvtAccess.pub' ubuntu@${item.private_ip}"
  ]
}

output "private_subnets_ids" {
  value = local.private_subnet_ids_list
}

output "sg_sk8_master_private" {
  value = aws_security_group.sg_k8s_worker.id
}

output "sg_sk8_worker_private" {
  value = aws_security_group.sg_k8s_master.id
}

output "lb_proxy_dns" {
  value = aws_lb.nlb_proxy.dns_name
}
