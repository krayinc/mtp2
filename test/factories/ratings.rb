# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :ratings do |f|
  f.user_id 1
  f.ratable_id 1
  f.ratable_type "MyString"
  f.score 1
  f.dimension "MyString"
end
