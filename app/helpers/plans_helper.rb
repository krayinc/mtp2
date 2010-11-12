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
end
