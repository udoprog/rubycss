require 'helper'

class TestRubycss < Test::Unit::TestCase
  should "generate selectors for symbols" do
    class Symbols
      include RubyCSS::StyleSheet

      classes :alpha, :omega do
        rule "foo1", "bar"
        rule "foo2", :bar
        rule :foo3, :bar
      end
    end

    assert_equal [".alpha,.omega {foo1: bar; foo2: bar; foo3: bar;}"], Symbols.compile
    assert Symbols.cached?
  end

  should "generate joined selectors for modules" do
    module CssModule
      include RubyCSS::StyleSheet

      class Test2
        include RubyCSS::StyleSheet
        classes :alpha
        classes :omega
      end
    end

    assert_equal ".alpha {}\n.omega {}", CssModule.compile(:join => "\n")
  end

  should "generate equal rules" do
    class Classes
      include RubyCSS::StyleSheet
      classes :omega
    end

    class ClassesRef
      include RubyCSS::StyleSheet
      select ".omega"
    end

    assert_equal ClassesRef.compile, Classes.compile
  end

  should "cache generated selectors" do
    class Classes
      include RubyCSS::StyleSheet
      classes :omega
    end

    Classes.compile
    assert Classes.cached?
  end

  should "extend multiple parents without specifying type" do
    class Test
      include RubyCSS::StyleSheet

      abstract :parent do
        border_radius 12
      end

      abstract :parent do
        border_radius 12
      end

      select '.child' do
        extends :parent
      end
    end

    assert_raise RubyCSS::StyleSheetError do
      Test.compile
    end
  end

  should "extend multiple parents when specifying :first" do
    class Test
      include RubyCSS::StyleSheet

      abstract :parent do
        width "100"
      end

      abstract :parent do
        width "200"
      end

      select '.child' do
        extends :parent, :first => true
      end
    end

    assert_equal [".child {width: 100;}"], Test.compile
  end

  should "extend multiple parents when specifying :all" do
    class Test
      include RubyCSS::StyleSheet

      abstract :parent do
        width "100"
      end

      abstract :parent do
        height "200"
      end

      select '.child' do
        extends :parent, :all => true
      end
    end

    assert_equal [".child {width: 100; height: 200;}"], Test.compile
  end

  should "cache then give the same result again" do
    class Test
      include RubyCSS::StyleSheet

      select '#alpha' do
        margin "20"
      end

      select '#omega' do
        margin "10"
      end

      select '#gamma' do
        extends "#alpha"
      end
    end

    assert !Test.cached?
    assert_equal ["#alpha {margin: 20;}", "#omega {margin: 10;}", "#gamma {margin: 20;}"], Test.compile
    assert Test.cached?
    assert_equal ["#alpha {margin: 20;}", "#omega {margin: 10;}", "#gamma {margin: 20;}"], Test.compile
  end
end
