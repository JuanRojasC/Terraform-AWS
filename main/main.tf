module "credentials" {
	source = "../credentials"
}

provider "aws" {
	region = module.credentials.region
    access_key = module.credentials.access_key
	secret_key = module.credentials.secret_key
}

module "ec2" {
    source = "../ec2-resource"
	key = module.credentials.key
}