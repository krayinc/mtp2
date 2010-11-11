module PhotosHelper
  def photo_drop_area(id, action, options={})
    javascript_tag <<-EOS
      new qq.FileUploader({
        element: $('##{escape_javascript id}')[0],
        action: '#{escape_javascript action}.json',
        debug: true,
        params: {
          authenticity_token: '#{form_authenticity_token}'
        },
        onSubmit: function(id, fileName){
          $.gritter.add({title: 'MTP', text: 'アップロード中...'});
        },
        onComplete: function(id, fileName, responseJSON){
          $.gritter.add(responseJSON['message']);
          if (responseJSON['status'] == 'success') {
            $('##{escape_javascript id}').parent().append(responseJSON['tag']);
          }
        }
      });
    EOS
  end

  def photo_tag(photo, style, opts = {})
    tag = image_tag(photo.url(style), :class => 'spotPhoto', :size => SpotPhoto::STYLES[style])
    tag = link_to(tag, photo.url, :target => 'original') if opts[:link_to_original]
    tag
  end
end
