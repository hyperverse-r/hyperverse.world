read_packages <- function() {
  yaml::read_yaml(here::here("_data/packages.yml"))
}

package_card <- function(pkg, link = NULL) {
  has_link <- !is.null(link) && !identical(link, "~")
  arrow    <- if (has_link) '<span class="card-arrow">↗</span>' else ""
  wrap_open  <- if (has_link) sprintf('<a href="%s" class="package-card" target="_blank" rel="noopener">', link) else '<div class="package-card">'
  wrap_close <- if (has_link) '</a>' else '</div>'

  sprintf('%s
    %s
    <div class="package-name">%s</div>
    <div class="package-desc">%s</div>
    <span class="package-badge %s">%s</span>
  %s',
    wrap_open, arrow, pkg$name, pkg$desc, pkg$badge_class, pkg$badge, wrap_close
  )
}

pkg_link <- function(p) {
  if (!is.null(p$pkgdown) && !identical(p$pkgdown, "~")) p$pkgdown else p$github
}

packages_grid <- function() {
  pkgs  <- read_packages()
  cards <- paste(sapply(pkgs, \(p) package_card(p, link = pkg_link(p))), collapse = "\n")
  htmltools::HTML(sprintf('<div class="packages-grid">%s</div>', cards))
}

packages_grid_home <- function() {
  featured <- c("htmxr", "alpiner", "supar")
  pkgs  <- read_packages()
  pkgs  <- pkgs[sapply(pkgs, \(p) p$name %in% featured)]
  cards <- paste(sapply(pkgs, \(p) package_card(p, link = pkg_link(p))), collapse = "\n")
  grid  <- htmltools::HTML(sprintf('<div class="packages-grid">%s</div>', cards))
  more <- '<div style="text-align:center; margin-top: 2rem;">
    <a href="ecosystem.html" class="btn-explore">Explore the ecosystem →</a>
  </div>'
  htmltools::HTML(paste0(grid, more))
}
