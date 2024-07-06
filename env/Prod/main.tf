module "Producao" {
  source      = "../../infra"
  name        = "producao"
  description = "django-aplication-production"
  environment = "prod"
  server      = "t2.micro"
  max         = 5
}
