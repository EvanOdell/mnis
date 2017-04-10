
#' mnis_reference
#'
#' A series of functions to return reference data. This data is useful for providing parameters for other function calls. The functions do not accept any arguments aside from the 'tidy' argument, which defaults to TRUE.
#' @param tidy Fix the variable names in the tibble to remove special characters and superfluous text, and converts the variable names to snake_case. Defaults to TRUE.
#' @keywords mnis
#' @export
#' @examples \dontrun{
#' ref_address_types()
#' # The types of addresses available in member's contact details.
#' # Includes websites and social media, as well as physical addresses.
#'
#' ref_answering_bodies()
#' # The bodies that members' can address questions to.
#'
#' ref_areas()
#' # Geographic areas.
#'
#' ref_area_types()
#' # Identifiers for grouping areas (e.g. borough constituencies).
#'
#' ref_biography_categories()
#' # Member biography categories.
#'
#' ref_cabinets()
#' # Connections that a member has to the cabinet or shadow cabinet.
#'
#' ref_committees()
#' # Identifier for parliamentary committees.
#'
#' ref_committee_types()
#' # Types of parliamentary committees.
#'
#' ref_constituencies()
#' # All constituencies.
#'
#' ref_constituency_areas()
#' # The links between constituencies and constituency areas.
#'
#' ref_constituency_types()
#' # Constituency categories.
#'
#' ref_countries()
#' # List of countries that could be listed as members' birthplace.
#'
#' ref_departments()
#' # Government and opposition departments.
#'
#' ref_disqualification_types()
#' # Types of ways members can be disqualified from sitting in the House.
#'
#' ref_elections()
#' # Codes of general and by-elections.
#'
#' ref_election_types()
#' # Election categories.
#'
#' ref_end_reasons()
#' # Reasons a member may leave the House of Lords or the House of Commons.
#'
#' ref_experience_types()
#' # Types of non-parliamentary experience members can list.
#'
#' ref_government_post_departments()
#' # All deparments that can contain government posts.
#'
#' ref_government_posts()
#' # All government posts.
#'
#' ref_government_ranks()
#' # All government post ranks.
#'
#' ref_honourary_prefixes()
#' # The types of honourary prefixes for members.
#'
#' ref_honour_lists()
#' # The types of honour lists that a member may be honoured in.
#'
#' ref_honours()
#' # The different honours available to members.
#'
#' ref_interest_categories()
#' # The categories available for reporting financial interests.
#'
#' ref_lords_membership_types()
#' # Different types of membership of the House of Lords.
#'
#' ref_lords_ranks()
#' # Ranks that peers may hold.
#'
#' ref_opposition_post_departments()
#' # The link between opposition posts and the government department they shadow.
#'
#' ref_opposition_posts()
#' # Opposition posts.
#'
#' ref_opposition_ranks()
#' # How opposition posts are ranked.
#'
#' ref_other_parliaments()
#' # Other parliaments that a member may have sat in.
#'
#' ref_parliamentary_posts()
#' # The different parliamentary posts available.
#'
#' ref_parliamentary_ranks()
#' # How those parliamentary posts are ranked.
#'
#' ref_parliament_types()
#' # Types of parliaments that parliamentary data may link to.
#'
#' ref_parties()
#' # All parties that members can be affiliated with.
#'
#' ref_party_sub_types()
#' # Sub-types of parties.
#'
#' ref_photo_outputs()
#' # Outputs that a photo of a member may be linked to.
#'
#' ref_statuses()
#' # A member's possible current status in the House.
#'
#' ref_titles()
#' # Salutory titles.
#'
#' mnis_reference()
#' # Returns a list of all possible reference functions.
#' }
#'
#' @export
#' @export
#' @rdname mnis_reference
mnis_reference <- function() {

    x <- c("ref_address_types()", "ref_answering_bodies()", "ref_areas()", "ref_area_types()", "ref_biography_categories()",
        "ref_cabinets()", "ref_committees()", "ref_committee_types()", "ref_constituencies()", "ref_constituency_areas()",
        "ref_constituency_types()", "ref_countries()", "ref_departments()", "ref_disqualification_types()", "ref_elections()",
        "ref_election_types()", "ref_end_reasons()", "ref_experience_types()", "ref_government_post_departments()",
        "ref_government_posts()", "ref_government_ranks()", "ref_honourary_prefixes()", "ref_honour_lists()", "ref_honours()",
        "ref_interest_categories()", "ref_lords_membership_types()", "ref_lords_ranks()", "ref_opposition_post_departments()",
        "ref_opposition_posts()", "ref_opposition_ranks()", "ref_other_parliaments()", "ref_parliamentary_posts()",
        "ref_parliamentary_ranks()", "ref_parliament_types()", "ref_parties()", "ref_party_sub_types()", "ref_photo_outputs()",
        "ref_statuses()", "ref_titles()")

    message("All Available Reference Functions:")

    print(x)
}



#' @export
#' @rdname mnis_reference
ref_address_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AddressTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$AddressTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_answering_bodies <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AnsweringBodies/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$AnsweringBodies)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_areas <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Areas/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Areas)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_area_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/AreaTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$AreaTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_biography_categories <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/BiographyCategories/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$BiographyCategories)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_cabinets <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Cabinets/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Cabinets)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_committees <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Committees/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Committees)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_committee_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/CommitteeTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$CommitteeTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_constituencies <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Constituencies/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Constituencies)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_constituency_areas <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyAreas/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$ConstituencyAreas)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }
}



#' @export
#' @rdname mnis_reference
ref_constituency_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ConstituencyTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$ConstituencyTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_countries <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Countries/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Countries)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_departments <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Departments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Departments)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_disqualification_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/DisqualificationTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$DisqualificationTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_elections <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Elections/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Elections)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_election_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ElectionTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$ElectionTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_end_reasons <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/EndReasons/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$EndReasons)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_experience_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ExperienceTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$ExperienceTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_government_post_departments <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPostDepartments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$GovernmentPostDepartments)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_government_posts <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$GovernmentPosts)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_government_ranks <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/GovernmentRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$GovernmentRanks)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_honourary_prefixes <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonouraryPrefixes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$HonouraryPrefixes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }
}



#' @export
#' @rdname mnis_reference
ref_honour_lists <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/HonourLists/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$HonourLists)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_honours <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Honours/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Honours)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_interest_categories <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/InterestCategories/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$InterestCategories)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_lords_membership_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsMembershipTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$LordsMembershipTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_lords_ranks <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/LordsRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$LordsRanks)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_opposition_post_departments <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPostDepartments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$OppositionPostDepartments)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_opposition_posts <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$OppositionPosts)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_opposition_ranks <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OppositionRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$OppositionRanks)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_other_parliaments <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/OtherParliaments/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$OtherParliaments)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_parliamentary_posts <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryPosts/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$ParliamentaryPosts)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }
}


#' @export
#' @rdname mnis_reference
ref_parliamentary_ranks <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentaryRanks/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$ParliamentaryRanks)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }
}



#' @export
#' @rdname mnis_reference
ref_parliament_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/ParliamentTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$ParliamentTypes)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}



#' @export
#' @rdname mnis_reference
ref_parties <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Parties/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Parties)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }
}



#' @export
#' @rdname mnis_reference
ref_party_sub_types <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PartySubTypes/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- as.list(got$PartySubTypes$PartySubType)

    x <- unlist(x)

    x <- t(x)

    x <- tibble::as_tibble(x)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_photo_outputs <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/PhotoOutputs/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$PhotoOutputs)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}


#' @export
#' @rdname mnis_reference
ref_statuses <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Statuses/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Statuses)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }

}




#' @export
#' @rdname mnis_reference
ref_titles <- function(tidy = TRUE) {

    baseurl <- "http://data.parliament.uk/membersdataplatform/services/mnis/ReferenceData/Titles/"

    got <- httr::GET(baseurl, httr::accept_json())

    if (httr::http_type(got) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }

    got <- tidy_bom(got)

    got <- jsonlite::fromJSON(got, flatten = TRUE)

    x <- tibble::as_tibble(got$Titles)

    if (tidy == TRUE) {

        x <- ref_tidy(x)

        x

    } else {

        x

    }
}