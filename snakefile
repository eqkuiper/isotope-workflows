configfile: "config/config.yaml"

rule isoreader:
    input: 
        dxf_raw="data/maca_bugs"
    output:
        out_file="data/dxf_raw.cf.rds" # do NOT include any file extensions here
    conda:
        "envs/isoreader.yaml"
    script:
        "code/isoreader_dxf.R"



