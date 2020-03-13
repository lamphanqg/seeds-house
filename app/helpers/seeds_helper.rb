module SeedsHelper
  def seed_image_group(form, seed, image_id)
    capture do
      concat seed_image_file_input(form, image_id)
      image = seed.send(image_id)
      if image.attached?
        concat seed_image_preview(image)
        concat remove_check_box(image_id)
      end
    end
  end

  def image_slider(seed)
    return if seed.images.blank?
    content_tag(:div, id: "image-slider-#{seed.id}", class: "carousel slide") do
      concat carousel_indicators(seed)
      concat carousel_inner(seed)
      concat carouse_controls(seed)
    end
  end

  private

  def remove_check_box(image_id)
    content_tag(:div, class: "form-check") do
      concat check_box_tag(:"remove_#{image_id}", true, false, class: "form-check-input")
      concat label_tag(:"remove_#{image_id}", "Remove image", class: "form-check-label")
    end
  end

  def seed_image_preview(seed_image)
    image_tag(seed_image, style: "width: 100%")
  end

  def seed_image_file_input(form, id)
    form.file_field(id, direct_upload: true,
                        accept: "image/*",
                        class: "form-control-file text-primary font-weight-bold form-control",
                        "data-title": "Drag and drop an image")
  end

  def carousel_indicators(seed)
    content_tag(:ol, class: "carousel-indicators") do
      concat content_tag(:li, "", "data-target": "#image-slider-#{seed.id}", "data-slide-to": "0", class: "active")
      (seed.images.size - 1).times do |i|
        concat content_tag(:li, "", "data-target": "#image-slider-#{seed.id}", "data-slide-to": "#{i + 1}")
      end
    end
  end

  def carousel_inner(seed)
    content_tag(:div, class: "carousel-inner") do
      concat(content_tag(:div, class: "carousel-item active") do
        image_tag(seed.images.first, class: "d-block w-100")
      end)
      seed.images[1..-1].each do |image|
        concat(content_tag(:div, class: "carousel-item") do
          image_tag(image, class: "d-block w-100")
        end)
      end
    end
  end

  def carouse_controls(seed)
    capture do
      concat(link_to("#image-slider-#{seed.id}", class: "carousel-control-prev", role: "button", "data-slide": "prev") do
        concat(content_tag(:span, "", class: "carousel-control-prev-icon", "aria-hidden": "true"))
        concat(content_tag(:span, "Previous", class: "sr-only"))
      end)

      concat(link_to("#image-slider-#{seed.id}", class: "carousel-control-next", role: "button", "data-slide": "next") do
        concat(content_tag(:span, "", class: "carousel-control-next-icon", "aria-hidden": "true"))
        concat(content_tag(:span, "Next", class: "sr-only"))
      end)
    end
  end
end
