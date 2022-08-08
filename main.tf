terraform {
  required_version = "1.2.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "key"
  secret_key                  = "secret"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    sns = "http://localhost:4566"
    sqs = "http://localhost:4566"
  }
}

module "trigger" {
  source   = "./sqs-subscribe-in-sns"
  sns_name = "trigger_topic"
  sqs_name = "something_trigger_to_process"
}

module "triggered" {
  source   = "./sqs-subscribe-in-sns"
  sns_name = "triggered_topic"
  sqs_name = "something_triggered_to_process"
}

module "trigger-done" {
  source   = "./sqs-subscribe-in-sns"
  sns_name = "trigger_done_topic"
  sqs_name = "something_trigger_done_to_process"
}

module "triggered-done" {
  source   = "./sqs-subscribe-in-sns"
  sns_name = "triggered_done_topic"
  sqs_name = "something_triggered_done_to_process"
}