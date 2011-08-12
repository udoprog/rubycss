require 'rubycss'

class Test
  include RubyCSS::StyleSheet

  @@base = c(:red)

  abstract :text_base do
    color @@base
  end

  select ".test" do
    extends :text_base
    margin 12
  end
end

puts Test.compile
