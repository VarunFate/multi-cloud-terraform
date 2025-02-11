terraform {
  backend "s3" {
    bucket         = "devopsprojectbucket1157"
    key            = "my-terraform-environment/main"
    region         = "ap-south-1"
    dynamodb_table = "dynamo-db-table"
  }
}
