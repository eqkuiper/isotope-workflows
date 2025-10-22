if(!requireNamespace("isoprocessor", quietly = TRUE)) devtools::install_github("isoverse/isoprocessor")

library("isoreader")
library("isoprocessor")
library("tidyverse")

dxf_raw <- readRDS("data/dxf_raw.cf.rds") # read in data from isoreader

dxf_comp <- dxf_raw %>% 
  iso_filter_files_with_problems() # remove aborted runs, etc

dxf_comp %>% 
  iso_plot_continuous_flow_data() + 
  scale_color_viridis_d(option="plasma")

ggsave(paste0(Sys.Date(), "_all_chromatograms.png"),
  width = 60,
  height = 40,
  limitsize=FALSE)


