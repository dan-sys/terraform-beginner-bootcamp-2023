variable "bucket_name" {
    description = "name of the bucket"
    type = string
}


variable "bucket_tag" {
    description = "tag on random bucket"
    type = string
}

variable "index_html_filepath" {
    description = "File Path for the index.html file"
    type = string

    validation {
      condition = fileexists(var.index_html_filepath)
      error_message = "The path provided for this index.html does not exist."
    }
}

variable "error_html_filepath" {
    description = "File Path for the error.html file"
    type = string

    validation {
      condition = fileexists(var.error_html_filepath)
      error_message = "The path provided for this error.html does not exist."
    }
}

variable "content_version" {
  description = "This represents the content of the html version. Value should be a +ve integer starting at 1"
  type = number

  validation {
    condition = var.content_version > 0 && floor(var.content_version)==var.content_version
    error_message = "The content version must be a positive integer that starts at 1"
  }
}