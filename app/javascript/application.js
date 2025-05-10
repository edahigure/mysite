// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

document.addEventListener("turbo:load", function() {
    // Dropdowns
    var dropdowns = [].slice.call(document.querySelectorAll('[data-bs-toggle="dropdown"]'))
    dropdowns.forEach(function (dropdown) {
      new bootstrap.Dropdown(dropdown)
    })
  
    // Tooltips (si los usas)
    var tooltips = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    tooltips.forEach(function (tooltip) {
      new bootstrap.Tooltip(tooltip)
    })
  })