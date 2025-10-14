rule isoreader:
    input: 
        dxf_raw="data/maca_bugs"
    output:
        out_file="data/dxf_raw" # do NOT include any file extensions here
    script:
        "code/01_isoreader.R"



