require 'helper'

class TestColors < Test::Unit::TestCase
  should "create a red css rule" do
    class Color
      include RubyCSS::StyleSheet

      select :body do
        color (c(200, 200, 200) - c(:grey) + c("#010101") + c("rgb(2,3,4)"))
      end
    end

    assert_equal ["body {color: #4b4c4d;}"], Color.compile
  end
end
