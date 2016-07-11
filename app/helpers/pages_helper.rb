
module PagesHelper
  def index_content(title, subtitle, poster, poster_link = '#' )
    content_tag(:div, class: 'post-preview') do
      concat(link_to(about_path) do
        concat(content_tag(:h2, title,    class: 'post-title'))    if title.present?
        concat(content_tag(:h3, subtitle, class: 'post-subtitle')) if subtitle.present?
      end)

      concat(content_tag(:p, link_to(poster, poster_link), class: 'post-meta')) if poster.present?
      concat(content_tag(:hr, ''))
    end
  end

  def pricing_content(title, description)
    content_tag(:li) do
      concat(title)
      concat(content_tag(:span, " #{description}"))
    end
  end

  def footer_content(icon_class, link = '#')
    content_tag(:li) do
      link_to(link) do
        content_tag(:span, class: 'fa-stack fa-lg') do
          concat(content_tag(:i, '', class: 'fa fa-circle fa-stack-2x'))
          concat(content_tag(:i, '', class: icon_class))
        end
      end
    end
  end
end
