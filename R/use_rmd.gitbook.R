#BEGIN: description
#' Gitbook template
#'
#' @usage
#' use_rmd.githbook(
#'   dir_path
#' )
#'
#' @param dir_path   \[character\], directory path to place template
#'
#' @export
#' @importFrom magrittr %>%
#END: description
#BEGIN: examples
#' @examples
#' #BEGIN: example
#' \dontrun{
#' # create the template
#' library(usethis)
#' library(writethat)
#' use_rmd.githbook('my_book')
#' # start editing a file
#' usethis::edit_file('./my_book/01-roadmap.Rmd')
#' }
#' #END: example
#END: examples
#BEGIN: code

use_rmd.githbook = function(
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

template_roadmap.Rmd = "
```{r setup roadmap, include=FALSE}
knitr::opts_chunk$set(
  echo = FALSE,
  eval = TRUE,
  warning = FALSE,
  message = FALSE
  )
```

# Roadmap

```{r roadmap}
library(tibble)
library(knitr)
tribble(
  ~name                   , ~implemented, ~paramchecks, ~unittested, ~documented, ~showcased,
  # commment
  '`myfun`'               ,        FALSE,        FALSE,       FALSE,       FALSE,      FALSE,
) %>% knitr::kable()
```
"

template_chapter.Rmd = "
```{r setup chapter, include=FALSE}
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE,
  message = FALSE
  )
```

# Chapter title

## Chapter subsection

```{r chapter subsection code}
print('a value')
```
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

  if (dir.exists(dir_path) && length(dir(dir_path)) != 0)
    rlang::abort(sprintf('dir_path exists and is not empty: %s\n', dir_path))
  if(!dir.exists(dir_path))
    dir.create(dir_path,recursive = TRUE)

  template_index.Rmd %>% readr::write_file(file = paste0(dir_path,'/','index.Rmd'))
  template_roadmap.Rmd %>% readr::write_file(file = paste0(dir_path,'/','01-roadmap.Rmd'))
  template_chapter.Rmd %>% readr::write_file(file = paste0(dir_path,'/','02-chapter.Rmd'))
  template_references.bib %>% readr::write_file(file = paste0(dir_path,'/','references.bib'))

}

#END: code
