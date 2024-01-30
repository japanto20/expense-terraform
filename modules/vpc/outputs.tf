output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "web_subnets" {
  value = aws_subnet.web.*.id
}

output "app_subnets" {
  value = aws_subnet.app.*.id
}

output "db_subnets" {
  value = aws_subnet.db.*.id
}