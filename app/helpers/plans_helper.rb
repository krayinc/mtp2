module PlansHelper
  def plan_status_label(status)
    Plan::Status.rassoc(status).to_a[0]
  end

  def plan_photo_list(plan, opts = {})
    opts = {
      :max => 6,
    }.merge(opts)
    result = ''
    plan.photos.shuffle[0...opts[:max]].each do |photo|
      result << photo_tag(photo.photo, :list, :link_to_original => true)
    end
    raw result
  end

  def plan_map_image_tag(plan, size)
    if plan.first_spot
      opts = {:latitude => plan.first_spot.latitude, :longitude => plan.first_spot.longitude, :zoom => 14}
    else
      opts = {:latitude => Spot::DEFAULT_POSITION[:latitude], :longitude => Spot::DEFAULT_POSITION[:longitude], :zoom => 3}
    end
    link_to map_image_tag(opts.merge(:size => size)), plan_path(plan)
  end
end
