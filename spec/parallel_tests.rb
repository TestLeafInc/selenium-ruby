require 'parallel'

# Specify just the test scripts in the array
scripts = [File.join(__dir__, 'create_lead.rb'), File.join(__dir__, 'merge_lead.rb')]

Parallel.each(scripts, in_threads: 2) do |script|
  system("rspec #{script}")
end
