if(!requireNamespace("isoprocessor", quietly = TRUE)) devtools::install_github("isoverse/isoprocessor")

# load required packages
library("isoreader")
library("isoprocessor")
library("tidyverse")

dxf_raw <- readRDS("data/dxf_raw.cf.rds") # read in data from isoreader

dxf_comp <- dxf_raw %>% 
  iso_filter_files_with_problems() # remove aborted runs, etc

dxf_comp %>% 
  iso_plot_continuous_flow_data() + # plot data
  scale_color_viridis_d(option="plasma") # change chromatogram colors


ggsave(paste0(Sys.Date(), "_all_chromatograms.png"), # save chromatogram plot
  width = 60,
  height = 40,
  limitsize=FALSE)

dxf_ratios <- dxf_comp %>% 
  iso_calculate_ratios(ratios = c("29/28", "30/28", "45/44", "46/44"))

isoviewer::iso_start_viewer()
