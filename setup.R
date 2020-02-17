# to render the site

rmarkdown::render_site()

# this will save everything in the docs directory
# this is right for all repositories *except* project.github.io
# so move everything (except img) to the base dir

files = list.files("docs", ".html", full.names = TRUE)
lapply(files, function(x) file.copy(x, "./"))
R.utils::copyDirectory("docs/site_libs", "./site_libs")

# now you can commit and push