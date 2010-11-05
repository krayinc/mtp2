class Regexp
  module Pattern
    module Common
      CRLF = /(\r\n|\r|\n)/
    end
  end
end

class String
  module Extender
    module Common
      def _truncate(unit, threshold, suffix = '...')
        case unit
          when :char  then self.truncate_by_characters(threshold, suffix)
          when :byte  then self.truncate_by_bytes(threshold, suffix)
          when :width then self.truncate_by_width(threshold, suffix)
          else raise ArgumentError
        end
      end

      def truncate_by_characters(threshold, suffix = '...')
        result = self.split(//)[0, threshold]
        if self != result.join('') and suffix != ''
          result = result[0, threshold - suffix.split(//).size].join('') + suffix
        else
          result = result.join('')
        end
        result
      end
      alias :truncate_by_chars :truncate_by_characters

      def truncate_by_bytes(threshold, suffix = '...')
        return self if self.length <= threshold
        self[0, threshold - suffix.length].slice(/\A.*/) + suffix
      end

      def split_by_characters
        self.split(//)
      end
      alias :split_by_chars :split_by_characters

      def width
        result  = 0
        chars   = self.split_by_characters
        result += chars.select{|c| c.ascii? or c.uax11_h? or c.uax11_na? or c.uax11_n?}.size
        result + (chars.size - result) * 2
      end
    end
  end

  include Extender::Common
end
