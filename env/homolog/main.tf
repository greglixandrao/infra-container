module "Homolog" {
  source = "../../infra"
  name = "homolog"
  description = "Django-Aplication-Homolog"
  environment = "homolog"
  server = "t2.micro"
  max = 2
}
