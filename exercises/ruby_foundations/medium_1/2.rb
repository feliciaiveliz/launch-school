# Text Analyzer - Sandwich Code

class TextAnalyzer
  def process
    file = File.open("sample.txt")
    yield(file)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |current_file| puts "#{current_file.read.split("\n\n").size} paragraphs" }
analyzer.process { |current_file| puts "#{current_file.readlines.size} lines" }
analyzer.process { |current_file| puts "#{current_file.read.split.size} words" }

# LS

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

# 3 paragraphs
# 15 lines
# 126 words