Paperclip::Attachment.interpolations[:hashed_name] = proc do |attachment, style|
  secret_key = 'MyTourPlanner'
  Digest::SHA1.hexdigest "#{attachment.instance.id}#{attachment.instance.created_at.to_i}#{secret_key}"
end
