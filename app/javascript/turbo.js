document.addEventListener("turbo:before-render", () => {
    // Guarda el estado de los dropdowns abiertos
    document.querySelectorAll('.dropdown-menu.show').forEach(menu => {
      menu.dataset.wasOpen = true
    })
  })
  
  document.addEventListener("turbo:render", () => {
    // Restaura dropdowns que estaban abiertos
    document.querySelectorAll('.dropdown-menu[data-was-open]').forEach(menu => {
      const dropdown = new bootstrap.Dropdown(menu.previousElementSibling)
      dropdown.show()
      delete menu.dataset.wasOpen
    })
  })