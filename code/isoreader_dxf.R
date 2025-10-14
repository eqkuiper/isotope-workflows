# install and load required libraries
if(!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")
devtools::install_github("isoverse/isoreader")

library("isoreader")

# read in .dxf files
dxf_raw <- iso_read_continuous_flow(snakemake@input[["dxf_raw"]], cache = FALSE)

iso_save(dxf_raw, snakemake@output[["out_file"]])