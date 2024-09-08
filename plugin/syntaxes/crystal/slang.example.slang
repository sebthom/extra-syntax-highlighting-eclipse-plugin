doctype html
html
  head
    title My Website
    meta charset="UTF-8"
    meta name="viewport" content="width=device-width, initial-scale=1.0"
    link rel="stylesheet" href="/styles.css"

  body
    header
      h1 Welcome to My Website
      nav
        ul
          li
            a href="/" Home
          li
            a href="/about" About
          li
            a href="/contact" Contact

    section#content
      == yield

    footer
      p &copy; 2024 My Website
