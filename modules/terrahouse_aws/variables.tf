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