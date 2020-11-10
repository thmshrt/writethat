#BEGIN: description
#' Create file for function using packaging template
#'
#'
#'
#' @usage
#' use_r.function(
#'   file_path,
#'   edit_file = TRUE
#' )
#'
#' @param file_path   \[character\], length == 1, file path
#' @param edit_file   \[logical\], length == 1, if TRUE will open file if rstudio is available
#'
#' @export
#' @importFrom magrittr %>%
#END: description
#BEGIN: examples
#' @examples
#' #BEGIN: example
#' \dontrun{
#' # creates a file
#' use_r.function('./myfun.R')
#' # will not overwrite an existing file
#' use_r.function('./myfun.R')
#' }
#' #END: example
#END: examples
#BEGIN: code

use_r.function = function(
  file_path,
  edit_file = TRUE
) {

  #BEGIN: param checks
  if (!(length(file_path) == 1))
    rlang::abort(message = 'param file_path must satisfy length(v) == 1')

  if (!(class(file_path) == 'character'))
    rlang::abort(message = "param file_path must satisfy class(v) == 'character'")

  if (!(length(edit_file) == 1))
    rlang::abort(message = 'param edit_file must satisfy length(v) == 1')

  if (!(class(edit_file) == 'logical'))
    rlang::abort(message = "param edit_file must satisfy class(v) == 'logical'")
  #END: param checks

  './templates/use_r.function.template.txt' -> template_path

  if(!file.exists(file_path)) {
    file.copy(template_path,file_path)
  } else {
    cat(sprintf('file_path exits: %s\n', file_path))
  }

  if(edit_file && rlang::is_interactive() && rstudioapi::isAvailable())
    rstudioapi::navigateToFile(file_path)
}

#END: code
