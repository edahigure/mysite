class Bootstrap5Renderer < WillPaginate::ActionView::LinkRenderer
    protected
  
    def html_container(html)
      tag(:nav, tag(:ul, html, container_attributes), aria: { label: 'Pagination' })
    end
  
    def page_number(page)
      if page == current_page
        tag(:li, link(page, '#', class: 'page-link'), class: 'page-item active')
      else
        tag(:li, link(page, page, class: 'page-link'), class: 'page-item')
      end
    end
  
    def previous_or_next_page(page, text, classname)
      if page
        tag(:li, link(text, page, class: 'page-link'), class: "page-item #{classname}")
      else
        tag(:li, link(text, '#', class: 'page-link'), class: "page-item #{classname} disabled")
      end
    end
  
    def gap
      tag(:li, link('&hellip;', '#', class: 'page-link'), class: 'page-item disabled')
    end
  end