require 'optparse'

class TemplateAnalyzer
  def initialize(threshold)
    @threshold = threshold
  end

  def analyze(template)
    subject_line = template['subject']
    body_content = template['body']

    # Validate input
    raise ArgumentError, 'Template must have "subject" and "body" keys' unless template.is_a?(Hash) &&
      template.key?('subject') && template.key?('body')

    # Compare subject lines and body content with the threshold
    subject_line_similarity = similarity(subject_line, @threshold)
    body_content_similarity = similarity(body_content, @threshold)

    # Return true if both subject lines and body content are suitable, false otherwise
    subject_line_similarity >= 0.5 && body_content_similarity >= 0.5
  end

  private

  def similarity(text, threshold)
    # Calculate the similarity between the text and the threshold using Levenshtein distance
    def levenshtein_distance(a, b)
      m, n = a.size, b.size
      dp = Array.new(m + 1) { Array.new(n + 1, 0) }
      (0..m).each do |i|
        dp[i][0] = i
      end
      (0..n).each do |j|
        dp[0][j] = j
      end
      (1..m).each do |i|
        (1..n).each do |j|
          cost = (a[i - 1] == b[j - 1]) ? 0 : 1
          dp[i][j] = [dp[i - 1][j] + 1, dp[i][j - 1] + 1, dp[i - 1][j - 1] + cost].min
        end
      end
      dp[m][n]
    end

    # Calculate the similarity between the text and the threshold
    distance = levenshtein_distance(text, threshold)
    1 - distance.to_f / [text.length, threshold.length].max
  end
end

def main
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: ruby main.rb [options]"
    opts.on("-t", "--threshold TEXT", "Threshold text") do |t|
      options[:threshold] = t
    end
    opts.on("-h", "--help", "Prints this help") do
      puts opts.banner
      exit
    end
  end.parse!

  template = {
    subject: 'Hello, World!',
    body: 'This is a test email.'
  }

  analyzer = TemplateAnalyzer.new(options[:threshold])
  suitable = analyzer.analyze(template)

  if suitable
    puts 'Template is suitable.'
  else
    puts 'Template is not suitable.'
  end
end

if __FILE__ == $0
  main
end