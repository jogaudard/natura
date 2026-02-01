partemp_read <- function(partemp_location) {


  partemp_og <- dir_ls(partemp_location)  |>
    map_dfr(read_csv,  na = c("#N/A", "Over"))

  partemp <- partemp_og |>
    clean_names() |>
    rename_with(
      ~ str_remove(.x, "_c$|_v$|_umolsm2$") 
    ) |>
    mutate(temp_can_yellow =
        case_when(
          is.na(temp_can_yellow) ~ temp_canl_yellow,
          .default = temp_can_yellow
        ),
      datetime = dmy_hms(paste(date_time))
    ) |>
    select(
      -c(type, par_input, temp_canl_yellow, date_time)
    )

  partemp
}
