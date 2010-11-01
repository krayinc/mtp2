AttributeNormalizer.configure do |config|
  config.normalizers[:half_width] = lambda do |value, options|
    value.is_a?(String) ? NKF.nkf('-Ww -m0 -Z1', value) : value
  end

  # The default normalizers if no :with option or block is given is to apply the :strip and :blank normalizers (in that order).
  # You can change this if you would like as follows:
  # config.default_normalizers = :strip, :blank
end
