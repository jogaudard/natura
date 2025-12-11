metadata_plan <- list(
    tar_target(
        name = create_threed_ZA_meta_data,
        command = create_threed_ZA_meta_data()
),
    tar_target(
        name = export_metadata,
        command = write_xlsx(create_threed_ZA_meta_data, "data/ZA_metadata.xlsx")
    )
)
