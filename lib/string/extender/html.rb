require 'cgi'
require 'string/extender/common'

class Regexp
  module Pattern
    module HTML
      BR = /<br(?:\s*\/)?>/i
    end
  end
end

class String
  module Extender
    module HTML
      def escape_html(*tags)
        if tags.empty?
          CGI.escapeHTML self
        else
          CGI.escapeElement self, tags
        end
      end
      alias :html_escape :escape_html

      def unescape_html(*tags)
        if tags.empty?
          CGI.unescapeHTML self
        else
          CGI.unescapeElement self, tags
        end
      end
      alias :html_unescape :unescape_html

      def encode_url
        CGI.escape self
      end
      alias :url_encode :encode_url

      def decode_url
        CGI.unescape self
      end
      alias :url_decode :decode_url

      def nl2br
        self.gsub Regexp::Pattern::Common::CRLF, '<br />'
      end

      def br2nl
        self.gsub Regexp::Pattern::HTML::BR, "\n"
      end
    end
  end

  include Extender::HTML
end
