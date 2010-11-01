class LatitudeValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    str = value.to_s
    r = (/^(\-?\d{1,2})(?:\.(\d+))?$/ === str and (($1.to_i.abs == 90 and $2.to_i == 0) or $1.to_i.abs < 90))
    record.errors[attribute] << (options[:message] || "is invalid") unless r
  end
end
