cflux_plan <- list(
  tar_target(
    name = partemp_get2026,
    command = get_file(
      node = "328hc",
      remote_path = "wp1_global_change_impact/raw_data/",
      file = "NatuRA_raw_partemp_2026.zip",
      path = "raw_data"
    ),
    format = "file"
  ),
  tar_target(
    name = partemp_unzip2026,
    command = unzip(
      zipfile = "raw_data/NatuRA_raw_partemp_2026.zip",
      exdir = "raw_data/NatuRA_raw_partemp_2026"
    ),
    format = "file"
  ),
  tar_target(
    name = cfluxmeta_get2026,
    command = get_file(
      node = "328hc",
      remote_path = "wp1_global_change_impact/raw_data",
      file = "cflux_datasheet_ThreeD_meta.csv",
      path = "raw_data"
    ),
    format = "file"
  ),
  tar_target(
    name = cflux_get2026,
    command = get_file(
      node = "328hc",
      remote_path = "wp1_global_change_impact/raw_data/NatuRA_raw_CO2",
      file = "NatuRA_raw_CO2_full_campaign_january_2026.data",
      path = "raw_data"
    ),
    format = "file"
  ),
  tar_target(
    name = partemp_read2026,
    command = partemp_read("raw_data/NatuRA_raw_partemp_2026")
  ),
  tar_target(
    name = cfluxmeta_read2026z,
    command = read_csv("raw_data/cflux_datasheet_ThreeD_meta.csv") |>
      mutate(
        start_time = ymd_hms(paste(date, start_time)),
        .keep = "unused"
      )
  ),
  tar_target(
    name = cflux_read2026,
    command =
      read_delim(
        "raw_data/NatuRA_raw_CO2_full_campaign_january_2026.data"
        , skip = 5
      ) |>
      slice(-1) |>
      select(c(DATE, TIME, CO2)) |>
      mutate(
        datetime = ymd_hms(paste(DATE, TIME)),
        CO2 = as.double(CO2),
        .keep = "unused"
      )
  )
)
