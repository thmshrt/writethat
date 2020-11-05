
#BEGIN: description
#' Gitbook template
#'
#' @usage
#' use_md.githbook(
#'   dir_path
#' )
#'
#' @param dir_path   \[character\], directory path to place template
#'
#' @export
#' @importFrom magrittr %>%
#END: description
#BEGIN: code

use_md.githbook = function(
  dir_path
) {

  #BEGIN: param checks
  if (!(length(dir_path) == 1))
    rlang::abort(message = 'param dir_path must satisfy length(v) == 1')

  if (!(class(dir_path) == 'character'))
    rlang::abort(message = "param dir_path must satisfy class(v) == 'character'")
  #END: param checks

  #BEGIN: computation
template_index.Rmd = "
---
title: \"title placeholder\"
author: \"author placeholder\"
site: bookdown::bookdown_site
output: bookdown::gitbook
bibliography: [references.bib]
---

```{r setup index, include=FALSE}
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE,
  message = FALSE
  )
```

# About {-}

<span style=\"color:red\"> placeholder </span>

## Motivation {-}

<span style=\"color:red\"> placeholder </span>

## Purpose {-}

<span style=\"color:red\"> placeholder </span>

## Installation {-}

<span style=\"color:red\"> package placeholder </span> will be available in CRAN as soon as

```r
install.packages('')
```

For now <span style=\"color:red\"> package placeholder </span> can be installed from github using

```r
library(devtools)
devtools::install_github('')
```
"

template_chapter_1.Rmd = "
```{r setup chapter 1, include=FALSE}
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE,
  message = FALSE
  )
```

# Chapter 1 Title

## Chapter 1 Subsection
"

template_references.bib = "
@article{ahu61,
   author={Arrow, Kenneth J. and Leonid Hurwicz and Hirofumi Uzawa},
   title={Constraint qualifications in maximization problems},
   journal={Naval Research Logistics Quarterly},
   volume={8},
   year=1961,
   pages={175-191}
}
"

  if(!dir.exists(dir_path)) {
    dir.create(dir_path,recursive = TRUE)
    template_index.Rmd %>% readr::write_file(file = paste0(dir_path,'/','index.Rmd'))
    template_chapter_1.Rmd %>% readr::write_file(file = paste0(dir_path,'/','01-chapter-1.Rmd'))
    template_references.bib %>% readr::write_file(file = paste0(dir_path,'/','references.bib'))
  } else if (dir.exists(dir_path) && length(dir(dir_path)) == 0) {
    template_index.Rmd %>% readr::write_file(file = paste0(dir_path,'/','index.Rmd'))
    template_chapter_1.Rmd %>% readr::write_file(file = paste0(dir_path,'/','01-chapter-1.Rmd'))
    template_references.bib %>% readr::write_file(file = paste0(dir_path,'/','references.bib'))
  } else {
    cat(sprintf('dir_path exists and is not empty: %s\n', dir_path))
  }
}

#END: code
#BEGIN: examples
#' @examples
#' #BEGIN: example
#' # operations
#' use_md.githbook(')
#' #END: example
#'
#' #BEGIN: example
#' # {case description}
#' {code placeholder}
#' #END: example
#'
#' #BEGIN: example
#' # {case description}
#' {code placeholder}
#' #END: example
#END: examples
