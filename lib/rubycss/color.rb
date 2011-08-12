module RubyCSS
  @@predefined_colors = {
    'alice_blue' => "#f0f8ff",
    'antique_white' => '#faebd7',
    'aqua' => '#00ffff',
    'aquamarine' => '#7fffd4',
    'azure' => '#f0ffff',
    'beige' => '#f5f5dc',
    'bisque' => '#ffe4c4',
    'black' => '#000000',
    'blanched_almond' => '#ffebcd',
    'blue' => '#0000ff',
    'blue_violet' => '#8a2be2',
    'brown' => '#a52a2a',
    'burly_wood' => '#deb887',
    'cadet_blue' => '#5f9ea0',
    'chartreuse' => '#7fff00',
    'chocolate' => '#d2691e',
    'coral' => '#ff7f50',
    'cornflower_blue' => '#6495ed',
    'cornsilk' => '#fff8dc',
    'crimson' => '#dc143c',
    'cyan' => '#00ffff',
    'dark_blue' => '#00008b',
    'dark_cyan' => '#008b8b',
    'dark_golden_rod' => '#b8860b',
    'dark_gray' => '#a9a9a9',
    'dark_grey' => '#a9a9a9',
    'dark_green' => '#006400',
    'dark_khaki' => '#bdb76b',
    'dark_magenta' => '#8b008b',
    'dark_olive_green' => '#556b2f',
    'darkorange' => '#ff8c00',
    'dark_orchid' => '#9932cc',
    'dark_red' => '#8b0000',
    'dark_salmon' => '#e9967a',
    'dark_sea_green' => '#8fbc8f',
    'dark_slate_blue' => '#483d8b',
    'dark_slate_gray' => '#2f4f4f',
    'dark_slate_grey' => '#2f4f4f',
    'dark_turquoise' => '#00ced1',
    'dark_violet' => '#9400d3',
    'deep_pink' => '#ff1493',
    'deep_sky_blue' => '#00bfff',
    'dim_gray' => '#696969',
    'dim_grey' => '#696969',
    'dodger_blue' => '#1e90ff',
    'fire_brick' => '#b22222',
    'floral_white' => '#fffaf0',
    'forest_green' => '#228b22',
    'fuchsia' => '#ff00ff',
    'gainsboro' => '#dcdcdc',
    'ghost_white' => '#f8f8ff',
    'gold' => '#ffd700',
    'golden_rod' => '#daa520',
    'gray' => '#808080',
    'grey' => '#808080',
    'green' => '#008000',
    'green_yellow' => '#adff2f',
    'honey_dew' => '#f0fff0',
    'hot_pink' => '#ff69b4',
    'indian_red' => '#cd5c5c',
    'indigo' => '#4b0082',
    'ivory' => '#fffff0',
    'khaki' => '#f0e68c',
    'lavender' => '#e6e6fa',
    'lavender_blush' => '#fff0f5',
    'lawn_green' => '#7cfc00',
    'lemon_chiffon' => '#fffacd',
    'light_blue' => '#add8e6',
    'light_coral' => '#f08080',
    'light_cyan' => '#e0ffff',
    'light_golden_rod_yellow' => '#fafad2',
    'light_gray' => '#d3d3d3',
    'light_grey' => '#d3d3d3',
    'light_green' => '#90ee90',
    'light_pink' => '#ffb6c1',
    'light_salmon' => '#ffa07a',
    'light_sea_green' => '#20b2aa',
    'light_sky_blue' => '#87cefa',
    'light_slate_gray' => '#778899',
    'light_slate_grey' => '#778899',
    'light_steel_blue' => '#b0c4de',
    'light_yellow' => '#ffffe0',
    'lime' => '#00ff00',
    'lime_green' => '#32cd32',
    'linen' => '#faf0e6',
    'magenta' => '#ff00ff',
    'maroon' => '#800000',
    'medium_aqua_marine' => '#66cdaa',
    'medium_blue' => '#0000cd',
    'medium_orchid' => '#ba55d3',
    'medium_purple' => '#9370d8',
    'medium_sea_green' => '#3cb371',
    'medium_slate_blue' => '#7b68ee',
    'medium_spring_green' => '#00fa9a',
    'medium_turquoise' => '#48d1cc',
    'medium_violet_red' => '#c71585',
    'midnight_blue' => '#191970',
    'mint_cream' => '#f5fffa',
    'misty_rose' => '#ffe4e1',
    'moccasin' => '#ffe4b5',
    'navajo_white' => '#ffdead',
    'navy' => '#000080',
    'old_lace' => '#fdf5e6',
    'olive' => '#808000',
    'olive_drab' => '#6b8e23',
    'orange' => '#ffa500',
    'orange_red' => '#ff4500',
    'orchid' => '#da70d6',
    'pale_golden_rod' => '#eee8aa',
    'pale_green' => '#98fb98',
    'pale_turquoise' => '#afeeee',
    'pale_violet_red' => '#d87093',
    'papaya_whip' => '#ffefd5',
    'peach_puff' => '#ffdab9',
    'peru' => '#cd853f',
    'pink' => '#ffc0cb',
    'plum' => '#dda0dd',
    'powder_blue' => '#b0e0e6',
    'purple' => '#800080',
    'red' => '#ff0000',
    'rosy_brown' => '#bc8f8f',
    'royal_blue' => '#4169e1',
    'saddle_brown' => '#8b4513',
    'salmon' => '#fa8072',
    'sandy_brown' => '#f4a460',
    'sea_green' => '#2e8b57',
    'sea_shell' => '#fff5ee',
    'sienna' => '#a0522d',
    'silver' => '#c0c0c0',
    'sky_blue' => '#87ceeb',
    'slate_blue' => '#6a5acd',
    'slate_gray' => '#708090',
    'slate_grey' => '#708090',
    'snow' => '#fffafa',
    'spring_green' => '#00ff7f',
    'steel_blue' => '#4682b4',
    'tan' => '#d2b48c',
    'teal' => '#008080',
    'thistle' => '#d8bfd8',
    'tomato' => '#ff6347',
    'turquoise' => '#40e0d0',
    'violet' => '#ee82ee',
    'wheat' => '#f5deb3',
    'white' => '#ffffff',
    'white_smoke' => '#f5f5f5',
    'yellow' => '#ffff00',
    'yellow_green' => '#9acd32'
  }

  def self.predefined_colors
    @@predefined_colors
  end

  #
  # Handle colors objects and translations between colors.
  #
  # Color.new(128,128,128) - Color.new("#ff0000") => Color(0, 128, 128)
  #
  # Colors are handled as tuples, with a couple of implemented operations.
  #
  class Color
    def initialize(*color)
      color = color[0] if color.size == 1

      color = color.to_s if color.kind_of? Symbol

      if color.kind_of? String
        color = RubyCSS.predefined_colors[color] if RubyCSS.predefined_colors.include?(color)

        if color.start_with?("#")
          color = get_hex(color)
        elsif color.start_with?("rgb(") and color.end_with?(")")
          color = get_rgb(color)
        else
          raise "Cannot convert to color: #{color}"
        end
      end

      if !color.kind_of? Array
        raise "Cannot convert to color: #{color}"
      end

      color = color[0...3]
      color = color + [0] * (3 - color.size)

      @color = filter_colors(color)
    end

    def -(other)
      if other.kind_of? Color
        return Color.new(@color.zip(other.color).map{|a,b| a - b})
      end

      if other.kind_of? Array
        return +(Color.new(*other))
      end

      send(:-, Color.new(other))
    end

    def +(other)
      if other.kind_of? Color
        return Color.new(@color.zip(other.color).map{|a,b| a + b})
      end

      if other.kind_of? Array
        return +(Color.new(*other))
      end

      send(:+, Color.new(other))
    end

    def to_s
      "#%02x%02x%02x" % @color
    end

    attr_accessor :color

private
    def filter_colors(color)
      color.map{|i| 0 < i && i < 255 ? i : 0}
    end

    def get_hex(color)
      return color[1...3].hex, color[3...5].hex, color[5...7].hex if color.size == 7
      return 0, 0, 0
    end

    def get_rgb(color)
      a = color[4...-1].split(",").map{|i| i.to_i}
    end
  end
end
