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
      :size       => '200x200',
      :longitude  => '0.0',
      :latitude   => '0.0',
      :zoom       => '14',
      :sensor     => false,
      :path       => '',
      :markers    => ''
    }.merge(options)
    raw %Q|
      <img src='http://maps.google.com/maps/api/staticmap?center=#{options[:longitude]},#{options[:latitude]}&zoom=#{options[:zoom]}&size=#{options[:size]}&sensor=#{options[:sensor]}&path=#{options[:path]}&markers=#{options[:markers]}' />
    |
  end
  def map_tag(options = {}, polyline = {})
    options = {
      :id           => 'map_canvas',
      :longitude    => '0.0',
      :latitude     => '0.0',
      :zoom         => '14',
      :sensor       => false,
      :markers      => ''
    }.merge(options)
    polyline = {
      :coordinates    => [],
      :strokeColor    => '#FF0000',
      :strokeOpacity  => '1.0',
      :strokeWeight   =>  '2'
    }.merge(polyline)
    latlng = ''
    if polyline[:coordinates].length > 0 then
      latlngs = []
      polyline[:coordinates].each do |coordinate|
        latlngs << 'new google.maps.LatLng(' + coordinate[:latitude] + ', ' + coordinate[:longitude] + ')'
      end
      latlng = 'new google.maps.Polyline({ path: [' + latlngs.join(',') + '], strokeColor: "' + polyline[:strokeColor] + '", strokeOpacity: ' + polyline[:strokeOpacity]+ ', strokeWeight: ' + polyline[:strokeWeight] + '}).setMap(map);'
    end
    raw %Q|
      <div id="#{options[:id]}" style="width: #{options[:width]}px; height: #{options[:height]}px"></div>
      <script language="javascript">
        var options = {
          zoom: #{options[:zoom]},
          center: new google.maps.LatLng(#{options[:longitude]}, #{options[:latitude]}),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("#{options[:id]}"), options);
        #{latlng}
      </script>
    |
  end
end
