# Precompute vignettes

# All files in folder
files <- list.files("vignettes")
# Indices for files ending with ".orig"
orig_ind <- grep("orig", files)
orig_files <- files[orig_ind]

# In case you want to compile only one of the vignettes:
orig_files
#orig_files <- orig_files[2]

# Knit all vignettes
for(vignette_file in orig_files){
  vignette_name <- paste0("vignettes/", vignette_file)
  vignette_rmd_name <- gsub(".orig", "", vignette_name)
  knitr::knit(vignette_name, output = vignette_rmd_name)
}

# Move figure folder into vignette folder
unlink("vignettes/figure", recursive = TRUE)
file.rename(from = "figure", to = "vignettes/figure")
