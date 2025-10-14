terraform {
  backend "s3" {
    bucket = "3tierappaws"  # replace with your bucket name
    key    = "backend/terraform.tfstate"
    region = "ap-south-1"
  }
}
