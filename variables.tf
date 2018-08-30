variable "name_stub" {
  type        = "string"
  description = "Optional string to use as beginning of output name."
  default     = ""
}

variable "total_length" {
  type        = "string"
  description = "Total length of the returned name (including supplied name_stub + random characters). If this value is less than length of supplied name_stub, it will be truncated such that the resulting string is exactly this length."
  default     = "8"
}

variable "allow_numbers" {
  type        = "string"
  description = "Allow numbers in random string"
  default     = true
}

variable "allow_special" {
  type        = "string"
  description = "Allow special characters in random string"
  default     = false
}

variable "allow_upper" {
  type        = "string"
  description = "Allow upper-case letters in random string"
  default     = false
}