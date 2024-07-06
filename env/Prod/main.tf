module "Producao" {
  source = "../../infra"
  name = "producao"
  description = "Django-Aplication-Production"
  environment = "Prod"
  server = "t2.micro"
  max = 5
}
