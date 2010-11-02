module ApplicationHelper
  def gmap(id, latitude, longitude, zoom)
    raw %Q|
      mtp.maps['#{id}'] = new google.maps.Map(
        $('##{id}').get(0), {
          zoom: #{zoom},
          center: new google.maps.LatLng(#{latitude}, #{longitude}),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
      );
    |
  end
  def map_image_tag(options = {})
    options = {
      :size => '200x200',
      :longitude => '0.0',
      :latitude => '0.0',
      :zoom => '14',
      :sensor => false,
    }.merge(options)
    raw %Q|
      <img src='http://maps.google.com/maps/api/staticmap?center=#{options[:longitude]},#{options[:latitude]}&zoom=#{options[:zoom]}&size=#{options[:size]}&sensor=#{options[:sensor]}' />
    |
  end
end
