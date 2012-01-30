module ApplicationHelper
  def link_to_menu(lbl, url, hash = {})
    if current_page? url
      le_class = 'active '
      if hash.has_key?(:class)
        le_class = le_class << hash[:class] 
      end
      hash.merge!({:class => le_class})
    end
    link_to(lbl, url, hash)
  end
end
