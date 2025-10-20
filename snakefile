configfile: "config/config.yaml"

rule isoreader:
    input: 
        dxf_raw="data/maca_bugs"
    output:
        out_file="data/dxf_raw.cf.rds", 
        problem_file="data/dxf_read_problems.csv"
    conda:
        "envs/isoreader.yaml"
    script:
        "code/isoreader_dxf.R"

rule analysis:
    input: 
        dxf_rds="data/dxf_raw.cf.rds"
    output:
        out_file="item.rds"
    conda: 
        "envs/isoreader.yaml"
    script:
        "analysis_dxf.R"

