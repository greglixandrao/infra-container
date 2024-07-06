terraform {
  backend "s3" {
	bucket = "terraform-infra-container"
	key = "homolog/terraform.tfstate"
	region = "us-west-2"
  }
}
