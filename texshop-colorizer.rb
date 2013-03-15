# encoding: utf-8
module Colors
  def colorize(text, color_code)
    "\033[#{color_code}m#{text}\033[0m"
  end

  { :black    => 30,
    :red      => 31,
    :green    => 32,
    :yellow   => 33,
    :blue     => 34,
    :magenta  => 35,
    :cyan     => 36,
    :white    => 37
  }.each do |key, color_code|
    define_method key do |text|
      colorize(text, color_code)
    end
  end

  def solarized_light
    [
      'background_R 0.99',
      'background_G 0.96',
      'background_B 0.89',
      'commandred 0.86',
      'commandgreen 0.196',
      'commandblue 0.184',
      'commentred 0.58',
      'commentgreen 0.63',
      'commentblue 0.63',
      'foreground_R 0.40',
      'foreground_G 0.48',
      'foreground_B 0.51',
      'indexred 0.83',
      'indexgreen 0.21',
      'indexblue 0.51',
      'markerred 0.165',
      'markergreen 0.63',
      'markerblue 0.596',
      'insertionpoint_R 0.40',
      'insertionpoint_G 0.48',
      'insertionpoint_B 0.51',
    ].each do |setting|
      `defaults write TeXShop #{setting}`
    end
  end

  def solarized_dark
    [
      'background_R 0.00',
      'background_G 0.169',
      'background_B 0.212',
      'commandred 0.86',
      'commandgreen 0.196',
      'commandblue 0.184',
      'commentred 0.345',
      'commentgreen 0.043',
      'commentblue 0.459',
      'foreground_R 0.514',
      'foreground_G 0.580',
      'foreground_B 0.589',
      'indexred 0.83',
      'indexgreen 0.21',
      'indexblue 0.51',
      'markerred 0.165',
      'markergreen 0.63',
      'markerblue 0.596',
      'insertionpoint_R 0.514',
      'insertionpoint_G 0.580',
      'insertionpoint_B 0.589',
    ].each do |setting|
      `defaults write TeXShop #{setting}`
    end
  end

  def default_colors
    [
      'background_R 1.0',
      'background_G 1.0',
      'background_B 1.0',
      'commandred 0.0',
      'commandgreen 0.0',
      'commandblue 1.0',
      'commentred 1.0',
      'commentgreen 0.0',
      'commentblue 0.0',
      'foreground_R 0.00',
      'foreground_G 0.00',
      'foreground_B 0.00',
      'indexred 1.00',
      'indexgreen 1.00',
      'indexblue 0.00',
      'insertionpoint_R 0.00',
      'insertionpoint_G 0.00',
      'insertionpoint_B 0.00',
      'markerred 0.02',
      'markergreen 0.51',
      'markerblue 0.13'
    ].each do |setting|
      `defaults write TeXShop #{setting}`
    end
  end

  def custom_colors
    [
      'background_R 0.00',
      'background_G 0.169',
      'background_B 0.212',
      'commentred 0.4',
      'commentgreen 0.4',
      'commentblue 0.4',
      'commandred 0.1',
      'commandgreen 0.3',
      'commandblue 0.9',
      'foreground_R 0.9',
      'foreground_G 0.9',
      'foreground_B 0.9',
      'indexred 0.83',
      'indexgreen 0.21',
      'indexblue 0.51',
      'insertionpoint_R 1.00',
      'insertionpoint_G 0.00',
      'insertionpoint_B 0.00',
      'markerred 0.02',
      'markergreen 1.0',
      'markerblue 0.13'
    ].each do |setting|
      `defaults write TeXShop #{setting}`
    end
  end

end

include Colors

puts green("Type 'light', 'dark' or 'custom' for solarized color scheme (everything else will restore the default colors):")
STDOUT.flush
user_input = STDIN.gets.chomp

if user_input == 'light'
  solarized_light
elsif user_input == 'dark'
  solarized_dark
elsif user_input == 'custom'
  custom_colors
else
  puts red("restoring default color scheme")
  default_colors
end
