#' Get Data Of Either Control Or Treatment Group
#'
#' A function that filters RNA data of control or treatment group.
#'
#' @param data data matrix of RNA counts.
#' @param group group of experiment that you want to take out.
#'
#' @return Returns a matrix
#'
#' @examples
#' data(library="GeneDiffAnal")
#' controls <- get_group_data(d, "control")
#' colnames(controls) # Control1, Control2, Control3, Control4, Control4
#'
#' @export
get_group_data <- function(data, group) {
  if(group == "control") { # Get control group data.
    return(data[, grep("*control", colnames(data), ignore.case = TRUE)])
  }
  else if(group == "treatment") { # Get treatment group data.
    return(data[,grep("*treatment*", colnames(data), ignore.case = TRUE)])
  } 
  else { # 
    stop("group should be either 'control' or 'treatment'.")
  }
}

# [END]