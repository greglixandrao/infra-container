module "Homolog" {
  source = "../../infra"
  name = "homolog"
  description = "jango-aplication-homolog"
  environment = "homolog"
  server = "t2.micro"
  max = 2
}
