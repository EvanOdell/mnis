
#' mnis_full_biog
#'
#' Requests all available biographical information for a given member.
#' @param ID The ID number of the member. If left empty, returns an error.
#' @param mnis_id Request based on the default membership ID scheme. Defaults to TRUE.
#' @param ref_dods Request based on the DODS membership ID scheme. Defaults to FALSE.
#' @param tidy Fix the variable names in the tibble to remove '@' characters and superfluous text. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' x <- mnis_mnis_full_biog(172)
#'
#' }

mnis_full_biog <- function(ID = NULL, mnis_id = TRUE, ref_dods = FALSE, tidy = TRUE) {

    if (is.null(ID) == TRUE) {
        stop("ID cannot be blank", call. = FALSE)
    }

    ID <- as.character(ID)

    if (ref_dods == TRUE) {
        ID_Type <- "refDods="
    } else {
        ID_Type <- "id="
    }

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/members/query/"

    query <- paste0(baseurl, ID_Type, ID, "/FullBiog")

    got <- httr::GET(query, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    dl <- data.frame(ID = rep(names(got), sapply(got, length)), Obs = unlist(got))

    x <- t(dl)

    x <- tibble::as_tibble(x)

    x <- x[rownames(x) != "ID", ]

    if (tidy == TRUE) {

        x <- mnis_tidy(x)

        x

    } else {

        x

    }

}