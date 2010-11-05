module DestinationsHelper
  def destination_photo_list(destination, opts)
    result = ''
    result << render('photos/form', :form_id => "destinations_new_photo_#{destination.id}", :form_action => plan_destination_photos_path(:plan_id => destination.plan_id, :destination_id => destination.id)) if opts[:upload]
    destination.photos.each do |photo|
      result << link_to(image_tag(photo.photo.url(:list), :align => 'left'), photo.photo.url)
    end
    raw result
  end
end
