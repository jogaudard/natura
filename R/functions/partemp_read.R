partemp_read <- function(location) {
    files <- list.files(location, pattern = "\\.csv$", full.names = TRUE)
    
    data_list <- lapply(files, function(file) {
        read.csv(file)
    })
    
    combined_data <- do.call(rbind, data_list)
    
    return(combined_data)
}