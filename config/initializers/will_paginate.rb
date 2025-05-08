WillPaginate::ActionView::LinkRenderer.class_eval do
    def link(text, target, attributes = {})
      attributes['class'] ||= ''
      attributes['class'] += ' pagination-link' unless attributes['class'].include?('pagination-nav')
      super
    end
end