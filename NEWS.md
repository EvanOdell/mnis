
# mnis 0.2.0

## Introducing New Naming Conventions, mnis_eligible and fixNames

The old function names were awkward. The new ones are all lower case and use underscores to seperate individual words. All old function names have been deprecated, but can still be called.

`mnis_eligible` returns a data frame with information on all members eligible or previously eligible to sit in the House of Lords, the House of Commons, or both.

The Members' Names Information Service returns variables names with extra text, including periods, @ signs and superfluous text stuck on the end of names. The fixNames parameter gives an option to remove this extra text.


# mnis 0.1.1

## Introducing mnis_JoinedBetween

`mnis_JoinedBetween` returns a data frame with information on all members who joined the House of Lords, the House of Commons, or both, between two given dates.

As the Members' Names Information Service has dozens of different search parameters and hundreds of possible combinations of searches, it is not reasonable to build functions for every possible query to the API. However, I will be rolling out functions for potentially common queries as and when I can. If you have any particular queries you would like functions for please let me know and I'll create it. 


# mnis 0.1.0

## Introducing the mnis package

This is the first release of the `mnis` package, which provides functions to download data from the Members' Names Information Service for the UK Houses of Parliament.

See the package documentation for details on each function and the type of data available.