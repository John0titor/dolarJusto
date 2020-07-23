my_packages <- c("quantmod","ecoseries","twitteR")
 install_if_missing <- function(p) {
 if(p %in% rownames(installed.packages())==FALSE){
 install.packages(p)}
 }
