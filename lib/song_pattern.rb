module SongPattern
  def load(pattern_file)
    pattern_file = 'pattern/default.rb' unless pattern_file
    pattern_text = open(pattern_file).read
    pattern = lambda do |velo, count, device|
      eval(pattern_text)
    end
  end
  module_function :load
end
