module DestinationsHelper
  def destination_photo_list(destination, opts = {})
    result = ''
    result << render('photos/form', :form_id => "destinations_new_photo_#{destination.id}", :form_action => plan_destination_photos_path(:plan_id => destination.plan_id, :destination_id => destination.id)) if opts[:edit]
    destination.photos.each do |photo|
      result << photo_tag(photo.photo, :list, :link_to_original => true)
    end
    raw result
  end
end
