=begin
                          ASCII CODE
---------------------------------------------------------------------
    | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
---------------------------------------------------------------------
0x00|NUL|SOH|STX|ETX|EOT|ENQ|ACK|BEL|BS |HT |NL |VT |NP |CR |SO |SI |
---------------------------------------------------------------------
0x10|DLE|DC1|DC2|DC3|DC4|NAK|SYN|ETB|CAN|EM |SUB|ESC|FS |GS |RS |US |
---------------------------------------------------------------------
0x20|SP | ! | " | # | $ | % | & | ' | ( | ) | * | + | , | - | . | / |
---------------------------------------------------------------------
0x30| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | : | ; | < | = | > | ? |
---------------------------------------------------------------------
0x40| @ | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O |
---------------------------------------------------------------------
0x50| P | Q | R | S | T | U | V | W | X | Y | Z | [ | \ | ] | ^ | _ |
---------------------------------------------------------------------
0x60| ` | a | b | c | d | e | f | g | h | i | j | k | l | m | n | o |
---------------------------------------------------------------------
0x70| p | q | r | s | t | u | v | w | x | y | z | { | | | } | ~ |DEL|
---------------------------------------------------------------------
=end

class Regexp
  module Pattern
    module CType
      ALNUM  = %r([0-9a-z])i
      ALPHA  = %r([a-z])i
      CNTRL  = %r([\x00-\x1F\x7F])
      DIGIT  = %r([0-9])i
      GRAPH  = %r([!-~])
      LOWER  = %r([a-z])
      UPPER  = %r([A-Z])
      PRINT  = %r([ -~])
      PUNCT  = %r([!-/:-@\[-`{-~])
      SPACE  = %r([\x09-\x0D ])
      XDIGIT = %r([0-9a-f])i
      ASCII  = %r([\x00-\x7F])

      UAX11_H = Regexp.new("[#{[8361].pack('U')}
        #{[65377].pack('U')}-#{[65500].pack('U')}
        #{[65512].pack('U')}-#{[65518].pack('U')}]", Regexp::EXTENDED, 'u')
      UAX11_Na = Regexp.new("[#{[162].pack('U')}-#{[163].pack('U')}
        #{[165].pack('U')}-#{[166].pack('U')}
        #{[172].pack('U')}
        #{[175].pack('U')}
        #{[10214].pack('U')}-#{[10221].pack('U')}
        #{[10629].pack('U')}-#{[10630].pack('U')}]", Regexp::EXTENDED, 'u')
      UAX11_N = Regexp.new("[#{[128].pack('U')}-#{[160].pack('U')}
        #{[169].pack('U')}
        #{[171].pack('U')}
        #{[181].pack('U')}
        #{[187].pack('U')}
        #{[192].pack('U')}-#{[197].pack('U')}
        #{[199].pack('U')}-#{[207].pack('U')}
        #{[209].pack('U')}-#{[214].pack('U')}
        #{[217].pack('U')}-#{[221].pack('U')}
        #{[226].pack('U')}-#{[229].pack('U')}
        #{[231].pack('U')}
        #{[235].pack('U')}
        #{[238].pack('U')}-#{[239].pack('U')}
        #{[241].pack('U')}
        #{[244].pack('U')}-#{[246].pack('U')}
        #{[251].pack('U')}
        #{[253].pack('U')}
        #{[255].pack('U')}-#{[256].pack('U')}
        #{[258].pack('U')}-#{[272].pack('U')}
        #{[274].pack('U')}
        #{[276].pack('U')}-#{[282].pack('U')}
        #{[284].pack('U')}-#{[293].pack('U')}
        #{[296].pack('U')}-#{[298].pack('U')}
        #{[300].pack('U')}-#{[304].pack('U')}
        #{[308].pack('U')}-#{[311].pack('U')}
        #{[313].pack('U')}-#{[318].pack('U')}
        #{[323].pack('U')}
        #{[325].pack('U')}-#{[327].pack('U')}
        #{[332].pack('U')}
        #{[334].pack('U')}-#{[337].pack('U')}
        #{[340].pack('U')}-#{[357].pack('U')}
        #{[360].pack('U')}-#{[362].pack('U')}
        #{[364].pack('U')}-#{[461].pack('U')}
        #{[463].pack('U')}
        #{[465].pack('U')}
        #{[467].pack('U')}
        #{[469].pack('U')}
        #{[471].pack('U')}
        #{[473].pack('U')}
        #{[475].pack('U')}
        #{[477].pack('U')}-#{[592].pack('U')}
        #{[594].pack('U')}-#{[608].pack('U')}
        #{[610].pack('U')}-#{[707].pack('U')}
        #{[709].pack('U')}-#{[710].pack('U')}
        #{[712].pack('U')}
        #{[716].pack('U')}
        #{[718].pack('U')}-#{[719].pack('U')}
        #{[721].pack('U')}-#{[727].pack('U')}
        #{[732].pack('U')}
        #{[734].pack('U')}
        #{[736].pack('U')}-#{[767].pack('U')}
        #{[880].pack('U')}-#{[912].pack('U')}
        #{[938].pack('U')}-#{[944].pack('U')}
        #{[962].pack('U')}
        #{[970].pack('U')}-#{[1024].pack('U')}
        #{[1026].pack('U')}-#{[1039].pack('U')}
        #{[1104].pack('U')}
        #{[1106].pack('U')}-#{[4348].pack('U')}
        #{[4448].pack('U')}-#{[4514].pack('U')}
        #{[4520].pack('U')}-#{[4601].pack('U')}
        #{[4608].pack('U')}-#{[8207].pack('U')}
        #{[8209].pack('U')}-#{[8210].pack('U')}
        #{[8215].pack('U')}
        #{[8218].pack('U')}-#{[8219].pack('U')}
        #{[8222].pack('U')}-#{[8223].pack('U')}
        #{[8227].pack('U')}
        #{[8232].pack('U')}-#{[8239].pack('U')}
        #{[8241].pack('U')}
        #{[8244].pack('U')}
        #{[8246].pack('U')}-#{[8250].pack('U')}
        #{[8252].pack('U')}-#{[8253].pack('U')}
        #{[8255].pack('U')}-#{[8305].pack('U')}
        #{[8309].pack('U')}-#{[8318].pack('U')}
        #{[8320].pack('U')}
        #{[8325].pack('U')}-#{[8360].pack('U')}
        #{[8362].pack('U')}-#{[8363].pack('U')}
        #{[8365].pack('U')}-#{[8450].pack('U')}
        #{[8452].pack('U')}
        #{[8454].pack('U')}-#{[8456].pack('U')}
        #{[8458].pack('U')}-#{[8466].pack('U')}
        #{[8468].pack('U')}-#{[8469].pack('U')}
        #{[8471].pack('U')}-#{[8480].pack('U')}
        #{[8483].pack('U')}-#{[8485].pack('U')}
        #{[8487].pack('U')}-#{[8490].pack('U')}
        #{[8492].pack('U')}-#{[8530].pack('U')}
        #{[8533].pack('U')}-#{[8538].pack('U')}
        #{[8543].pack('U')}
        #{[8556].pack('U')}-#{[8559].pack('U')}
        #{[8570].pack('U')}-#{[8584].pack('U')}
        #{[8602].pack('U')}-#{[8631].pack('U')}
        #{[8634].pack('U')}-#{[8657].pack('U')}
        #{[8659].pack('U')}
        #{[8661].pack('U')}-#{[8678].pack('U')}
        #{[8680].pack('U')}-#{[8703].pack('U')}
        #{[8705].pack('U')}
        #{[8708].pack('U')}-#{[8710].pack('U')}
        #{[8713].pack('U')}-#{[8714].pack('U')}
        #{[8716].pack('U')}-#{[8718].pack('U')}
        #{[8720].pack('U')}
        #{[8722].pack('U')}-#{[8724].pack('U')}
        #{[8726].pack('U')}-#{[8729].pack('U')}
        #{[8731].pack('U')}-#{[8732].pack('U')}
        #{[8737].pack('U')}-#{[8738].pack('U')}
        #{[8740].pack('U')}
        #{[8742].pack('U')}
        #{[8749].pack('U')}
        #{[8751].pack('U')}-#{[8755].pack('U')}
        #{[8760].pack('U')}-#{[8763].pack('U')}
        #{[8766].pack('U')}-#{[8775].pack('U')}
        #{[8777].pack('U')}-#{[8779].pack('U')}
        #{[8781].pack('U')}-#{[8785].pack('U')}
        #{[8787].pack('U')}-#{[8799].pack('U')}
        #{[8802].pack('U')}-#{[8803].pack('U')}
        #{[8808].pack('U')}-#{[8809].pack('U')}
        #{[8812].pack('U')}-#{[8813].pack('U')}
        #{[8816].pack('U')}-#{[8833].pack('U')}
        #{[8836].pack('U')}-#{[8837].pack('U')}
        #{[8840].pack('U')}-#{[8852].pack('U')}
        #{[8854].pack('U')}-#{[8856].pack('U')}
        #{[8858].pack('U')}-#{[8868].pack('U')}
        #{[8870].pack('U')}-#{[8894].pack('U')}
        #{[8896].pack('U')}-#{[8977].pack('U')}
        #{[8979].pack('U')}-#{[9000].pack('U')}
        #{[9003].pack('U')}-#{[9290].pack('U')}
        #{[9450].pack('U')}
        #{[9548].pack('U')}-#{[9551].pack('U')}
        #{[9588].pack('U')}-#{[9599].pack('U')}
        #{[9616].pack('U')}-#{[9617].pack('U')}
        #{[9622].pack('U')}-#{[9631].pack('U')}
        #{[9634].pack('U')}
        #{[9642].pack('U')}-#{[9649].pack('U')}
        #{[9652].pack('U')}-#{[9653].pack('U')}
        #{[9656].pack('U')}-#{[9659].pack('U')}
        #{[9662].pack('U')}-#{[9663].pack('U')}
        #{[9666].pack('U')}-#{[9669].pack('U')}
        #{[9673].pack('U')}-#{[9674].pack('U')}
        #{[9676].pack('U')}-#{[9677].pack('U')}
        #{[9682].pack('U')}-#{[9697].pack('U')}
        #{[9702].pack('U')}-#{[9710].pack('U')}
        #{[9712].pack('U')}-#{[9732].pack('U')}
        #{[9735].pack('U')}-#{[9736].pack('U')}
        #{[9738].pack('U')}-#{[9741].pack('U')}
        #{[9744].pack('U')}-#{[9747].pack('U')}
        #{[9750].pack('U')}-#{[9755].pack('U')}
        #{[9757].pack('U')}
        #{[9759].pack('U')}-#{[9791].pack('U')}
        #{[9793].pack('U')}
        #{[9795].pack('U')}-#{[9823].pack('U')}
        #{[9826].pack('U')}
        #{[9830].pack('U')}
        #{[9835].pack('U')}
        #{[9838].pack('U')}
        #{[9840].pack('U')}-#{[9885].pack('U')}
        #{[9888].pack('U')}-#{[9917].pack('U')}
        #{[9920].pack('U')}-#{[9923].pack('U')}
        #{[9985].pack('U')}-#{[10044].pack('U')}
        #{[10046].pack('U')}-#{[10070].pack('U')}
        #{[10072].pack('U')}-#{[10101].pack('U')}
        #{[10112].pack('U')}-#{[10213].pack('U')}
        #{[10222].pack('U')}-#{[10628].pack('U')}
        #{[10631].pack('U')}-#{[11092].pack('U')}
        #{[11264].pack('U')}-#{[11825].pack('U')}
        #{[12351].pack('U')}
        #{[19904].pack('U')}-#{[19967].pack('U')}
        #{[42192].pack('U')}-#{[43359].pack('U')}
        #{[43392].pack('U')}-#{[44025].pack('U')}
        #{[55296].pack('U')}-#{[56320].pack('U')}
        #{[64256].pack('U')}-#{[65021].pack('U')}
        #{[65056].pack('U')}-#{[65062].pack('U')}
        #{[65136].pack('U')}-#{[65279].pack('U')}
        #{[65529].pack('U')}-#{[65532].pack('U')}
        #{[65536].pack('U')}-#{[127123].pack('U')}
        #{[127278].pack('U')}
        #{[917505].pack('U')}-#{[917631].pack('U')}]", Regexp::EXTENDED, 'u')
    end
  end
end

class String
  module Extender
    module CType
      def alnum?
        Regexp::Pattern::CType::ALNUM === self
      end

      def alpha?
        Regexp::Pattern::CType::ALPHA === self
      end
      alias :alphabet? :alpha?

      def cntrl?(*args)
        str = self.dup
        str.tr_s! args.join(''), '' unless args.empty?
        Regexp::Pattern::CType::CNTRL === str
      end
      alias :control? :cntrl?

      def digit?
        Regexp::Pattern::CType::DIGIT === self
      end
      alias :numeric? :digit?

      def graph?
        Regexp::Pattern::CType::GRAPH === self
      end
      alias :graphical? :graph?

      def lower?
        Regexp::Pattern::CType::LOWER === self
      end

      def upper?
        Regexp::Pattern::CType::UPPER === self
      end

      def print?
        Regexp::Pattern::CType::PRINT === self
      end
      alias :printable? :print?

      def punct?
        Regexp::Pattern::CType::PUNCT === self
      end
      alias :punctuation? :punct?

      def space?
        Regexp::Pattern::CType::SPACE === self
      end

      def xdigit?
        Regexp::Pattern::CType::XDIGIT === self
      end

      def ascii?
        Regexp::Pattern::CType::ASCII === self
      end

      def uax11_h?
        Regexp::Pattern::CType::UAX11_H === self
      end
      alias :halfwidth? :uax11_h?

      def uax11_na?
        Regexp::Pattern::CType::UAX11_Na === self
      end
      alias :uax11_narrow? :uax11_na?

      def uax11_n?
        Regexp::Pattern::CType::UAX11_N === self
      end
      alias :uax11_neutral? :uax11_n?
    end
  end

  include Extender::CType
end
