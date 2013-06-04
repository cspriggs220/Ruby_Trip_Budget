module Formatter
  def format_layout
    puts "\n-------------------------------------------"
    yield
    puts "-------------------------------------------"
  end
end