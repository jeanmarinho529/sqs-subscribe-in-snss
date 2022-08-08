variable "sns_name" {
  type        = string
  description = "topic name"
}

variable "sqs_name" {
  type        = string
  description = "queue name"
}

variable "subscribe_protocol" {
  type        = string
  description = "subscribe protocol"
  default = "sqs"
}

variable "tags" {
    type        = map(string)
    description = "tags"
    default     = {
        Environment = "local-test"
    }
}

