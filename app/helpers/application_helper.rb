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
end
