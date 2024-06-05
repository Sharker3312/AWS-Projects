output "amplify_app_id" {
  value = aws_amplify_app.hello_world_amplify.id
}

output "custom_domain_url" {
  value = "https://${aws_amplify_branch.amplify_branch.branch_name}.${var.domain_name}"
}