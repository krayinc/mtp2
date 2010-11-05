module PhotosHelper
  def photo_drop_area(id, action, options={})
    javascript_tag <<-EOS
      new qq.FileUploader({
        element: $('##{escape_javascript id}')[0],
        action: '#{escape_javascript action}',
        debug: true,
        params: {
          authenticity_token: '#{form_authenticity_token}'
        }
      });
    EOS
  end
end
