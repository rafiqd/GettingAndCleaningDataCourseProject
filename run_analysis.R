get_col_titles <- function(title_file_path){
    titles = read.table(title_file_path)
    return(titles[,2])
    
}

get_data_from_file <- function(path, col_names){
    
    dat_file = sprintf('X_%s.txt', basename(path))
    act_file = sprintf('y_%s.txt', basename(path))
    sub_file = sprintf('subject_%s.txt', basename(path))
    dat <- read.table(file.path(path, dat_file), col.names = col_names)
    train_activity <- read.table(file.path(path, act_file), col.names = c("Activity"))
    subject <- read.table(file.path(path, sub_file), col.names = c("Subject"))

    full_table <- cbind(dat, train_activity, subject)
                        
    return(full_table)
}


create_aggregate_data <- function(){
    title_file <- './UCI HAR Dataset/features.txt'

    title_vector <- get_col_titles(title_file)
    test_dat <- get_data_from_file('./UCI HAR Dataset/test', title_vector)
    train_dat <- get_data_from_file('./UCI HAR Dataset/train', title_vector)
    activity_factors_path = './UCI HAR Dataset/activity_labels.txt'
    labels <- read.table(activity_factors_path)
    dat <- rbind(train_dat, test_dat)
    new_dat <- dat[, grep(c("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]|Activity|Subject"), names(dat))]
    
    aggregate_dat <- aggregate(new_dat, by=c(new_dat["Activity"], new_dat["Subject"]), FUN = mean)
    Activity <- factor(aggregate_dat[,"Activity"], labels[,1], labels=labels[,2])
    full_data <- cbind(aggregate_dat[, !(colnames(aggregate_dat) %in% c("Activity"))], Activity)
    write.table(full_data, 'data.txt', row.names=FALSE)
    return(full_data)
}