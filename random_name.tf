# This module creates a fixed-length random name that attempts to be unique by padding an optional
# string with random lowercase characters/numbers.  Length of resulting name can be specified as a
# variable (defaults to 8 characters)  Several/most uses for this module require the first character
# be a letter, so always set first character to a letter.

locals {
  rand_length = "${(length(var.name_stub) >= var.total_length) ? var.total_length : (var.total_length - length(var.name_stub))}"
  rand_name = "${(length(var.name_stub) >= var.total_length) ? substr(var.name_stub,0,min(length(var.name_stub),var.total_length)) : substr(format("%s%s%s",var.name_stub,random_string.first_char.result,random_string.rest_of_string.result),0,var.total_length)}"
}

resource "random_string" "first_char" {
  length = 1
  special = false
  upper = false
  number = false
}

resource "random_string" "rest_of_string" {
  length = "${max((local.rand_length - 1),1)}"
  special = "${var.allow_special}"
  upper = "${var.allow_upper}"
  number = "${var.allow_numbers}"
}