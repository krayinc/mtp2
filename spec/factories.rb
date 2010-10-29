Factory.define :user do |f|
  f.sequence(:login) {|n| "username_#{n}" }
  f.sequence(:twitter_id) {|n| n }
end

Factory.define :plan do |f|
  f.owner {|owner| owner.association(:user)}
  f.title 'Title'
  f.status 1
  f.outline 'Outline Text...'
  f.public false
end

Factory.define :voting do |f|
  f.user {|user| user.association(:user)}
  f.votable {|votable| votable.association(:plan)}
end

Factory.define :spot do |f|
  f.name 'Name'
  f.latitude '123.4567'
  f.longitude '12.3456'
  f.address 'Address'
  f.annotation 'Annotation'
end
