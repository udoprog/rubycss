#
# The following is a somewhat valid grid css which was generated from http://960.gs
# and then converted into RubyCSS.
#
# The original file is about 360 lines long.
#
require 'rubycss'

class GridCss
  include RubyCSS::StyleSheet

  select :body do
    margin 0
    padding 0
  end

  classes :container_12 do
    margin_left :auto
    margin_right :auto
    width 960
  end

  classes (1..12).map{|v| "grid_#{v}"} do
    rule :display, :inline
    rule :float, :left
    rule :position, :relative
    margin_left 10
    margin_right 10
  end

  classes (1..12).map{|v| ["push_#{v}", "pull_#{v}"]} do
    rule :position, :relative
  end

  classes :alpha, :margin_left => 0
  classes :omega, :margin_left => 0

  (1..12).each do |v|
    classes "container_12", "grid_#{v}", :width => 60*v + 20*(v-1)
    classes "container_12", "prefix_#{v}", :padding_left => 80*v
    classes "container_12", "suffix_#{v}", :padding_right => 80*v
    classes "container_12", "push_#{v}", :left => 80*v
    classes "container_12", "pull_#{v}", :left => -80*v
  end

  classes "clear",
    :clear => :both, :display => :block,
    :overflow => :hidden, :visibility => :hidden,
    :width => 0, :height => 0

  # http://www.yuiblog.com/blog/2010/09/27/clearfix-reloaded-overflowhidden-demystified */

  select ".clearfix:before", ".clearfix:after" do
    rule :content, "'\\0020'"
    display :block
    overflow :hidden
    visibility :hidden
    width 0
    height 0
  end

  select ".clearfix:after" do
    rule :clear, :both
  end

  #
  # The following zoom:1 rule is specifically for IE6 + IE7.
  # Move to separate stylesheet if invalid CSS is a problem.
  #
  classes "clearfix" do
    rule :zoom, "1"
  end
end

puts GridCss.compile
