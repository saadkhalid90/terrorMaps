## function that checks whether a package exists and if it doesn't installs it
pkg_chk_install <- function(package_name){
  if (!(package_name %in% row.names(installed.packages()))){
    install.packages(package_name)
  }
}

## check and install package
pkg_chk_install("rjson")

library(rjson)

## read in district level and province level topojson
district_level <- fromJSON(file = "pakistan_districts.topojson")
prov_level <- fromJSON(file = "pakistan_prov.topojson")

layered <- district_level
## adding provice level info to the district level duplicate
layered[['objects']][['pakistan_prov']] <- prov_level$objects$pakistan_prov

length(layered$arcs)

write(toJSON(layered), file = 'pak_dist_prov.topojson')
