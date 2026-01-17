cflux_plan <- list(
    tar_target(
        name = partemp_fetch2026,
        command = get_file(
            node = "328hc",
            remote_path = "wp1_global_change_impact/raw_data/NaturA_raw_partemp/",
            file = "NaturA_raw_partemp_2026.zip",
            path = "raw_data/cfluxes"
        ) |> unzip(
            exdir = "raw_data/cfluxes/NaturA_raw_partemp_2026"
        )
),
    tar_target(
        name = partemp_read2026,
        command = 
    )
)
