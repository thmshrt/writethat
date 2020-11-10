
# format all files for packaging
list.files('./R/',full.names = TRUE) %>%
  grep(pattern = 'R$',value = TRUE) %>%
  (function(.x) for (v in .x) reformat_packaging(v,dry_run=FALSE))

# format all files for developing
list.files('./R/',full.names = TRUE) %>%
  grep(pattern = 'R$',value = TRUE) %>%
  (function(.x) for (v in .x) reformat_developing(v,dry_run=FALSE))
