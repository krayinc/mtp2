module Typus
  class << self
    def locales_mapping_with_japanese
      mapping = locales_mapping_without_japanese
      mapping['ja'] = '日本語'
      return mapping
    end
    alias_method_chain :locales_mapping, :japanese
  end
end
