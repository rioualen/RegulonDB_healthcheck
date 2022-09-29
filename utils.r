library(DT)
library(readxl)

random_palette <- function(n){
  sample(grDevices::colors()[grep("gr(a|e)y", grDevices::colors(), invert = T)], n)
}


## update 04/07/22 add NA test
## update 10/08/2022 add sort
concat_uniq <- function(x, sep = ","){
  res <- paste0(sort(unique(na.omit(x))), collapse = sep)
  if(res == "") {res <- NA}
  res
}

concat <- function(x, sep = ","){
  res <- paste0(na.omit(x), collapse = sep)
  if(res == "") {res <- NA}
  res
}

concat_uniq2 <- function(..., sep = ","){
	vec <- paste(na.omit(c(...)), collapse = sep)
	res <- gsub("^,", "", paste(unique(sort(stringr::str_split(vec, pattern = ",")[[1]])), collapse = sep))
	res
}

rm_brackets <- function(x){
	str_replace_all(x, "\\[|\\]|\\ ", "")
}

rm_special_char <- function(x){
	str_replace_all(x, "\\[|\\]|\\ |\\|", "")
}

capitalize <- function(x){
	CapStr <- function(y) {
		c <- strsplit(y, " ")[[1]]
		paste(toupper(substring(c, 1,1)), substring(c, 2),
					sep="", collapse=" ")
	}
	sapply(x, CapStr)
}

## label plots
label_box <- function(x){return(c(y = median(x), label = length(x)))}


### upset get binary table with rownames
fromList <- function (input) {
  # Same as original fromList()...
  elements <- unique(unlist(input))
  data <- unlist(lapply(input, function(x) {
    x <- as.vector(match(elements, x))
  }))
  data[is.na(data)] <- as.integer(0)
  data[data != 0] <- as.integer(1)
  data <- data.frame(matrix(data, ncol = length(input), byrow = F))
  data <- data[which(rowSums(data) != 0), ]
  names(data) <- names(input)
  # ... Except now it conserves your original value names!
  elements[is.na(elements)] <- "NA" #### added 2022-09-27
  row.names(data) <- elements
  return(data)
}


## wrapper function to remove commented rows from excel sheets
read_excel_cm <- function(file, sheet, comment.char = "#", na = c("", "NA")){
  tab <- read_excel(file, sheet, col_names = F, na = na)
  skip_rows <- grep(paste0("^", comment.char), unlist(c(tab[,1])))
  if(length(skip_rows) > 0) tab <- read_excel(file, sheet, skip = max(skip_rows))
  return(tab)
}

#--------------- plots

#---- x
simple_hist <- function(df, x){
  ggplot(df, aes(get(x))) +
    geom_histogram(stat = "count") +
    labs(
      title = deparse(substitute(df)),
      subtitle = "",
      caption = ".",
      tag = "",
      x = x,
      # colour = "Legend title"
    ) +
    theme_minimal()
}
# simple_hist(iris, "Petal.Width")

#---- xy
simple_plot <- function(df, x, y){
  ggplot(df, aes(get(x), get(y))) +
    geom_point()
  # ggtitle("") +
  # labs(x = "", y = "")
}
# simple_plot(iris, "Sepal.Length", "Petal.Width")

simple_line <- function(df, x, y){
  ggplot(df, aes(get(x), get(y))) +
    geom_line()
  # ggtitle("") +
  # labs(x = "", y = "")
}
# simple_line(iris, "Sepal.Length", "Petal.Width")

simple_bar <- function(df, x, y){
  ggplot(df, aes(get(x), get(y))) +
    geom_bar(stat = "identity") +
    ggtitle(deparse(substitute(df))) +
    labs(x = deparse(substitute(x)), y = deparse(substitute(y)))
}

# simple_bar(iris, "Species", "Sepal.Length") +  coord_flip() 


## add inheritance for further params custom - wrapper function
simple_box <- function(df, x, y) {
   ggplot(df, aes(get(x), get(y))) +
    geom_boxplot() +
    labs(
      title = deparse(substitute(df)),
      subtitle = "",
      caption = ".",
      tag = "",
      x = x,
      y = y,
      # colour = "Legend title"
    ) +
    theme_minimal()
}
# simple_box(iris, "Species", "Petal.Width")

