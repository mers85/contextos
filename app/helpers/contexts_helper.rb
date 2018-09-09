module ContextsHelper

  def link_to_toggle_context_favourite(context, user)
    url = context_favourite_path(context)

    if context.favourited?(user)
      link_to_with_icon('fa fa-heart', url, {
        method: 'DELETE',
        remote: true,
        class: 'favourite favourite-heart',
      })
    else
      link_to_with_icon('fa fa-heart-o', url, {
        method: 'PUT',
        remote: true,
        class: 'favourite unfavourite-heart',
      })
    end
  end

  def link_to_with_icon(icon_css, url, options = {})
    icon = content_tag(:i, nil, class: icon_css)
    link_to(icon.html_safe, url, options)
  end

  def load_image_for(context)
    if context.pictures.any?
      image_tag context.pictures.sample.image, class: "img-fluid"
    else
      image_tag "img-news.jpg", class: "img-fluid"
    end
  end
end
