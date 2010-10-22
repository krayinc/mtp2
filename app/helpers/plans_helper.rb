module PlansHelper
  def plan_status_label(status)
    Plan::Status.rassoc(status).to_a[0]
  end
end
