begin
  require 'bundler'
  Bundler::GemHelper.install_tasks
rescue LoadError
  puts 'although not required, bundler is recommended during development'
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = ['--options', 'spec/spec.opts']
end

task :test => :spec
task :default => :spec


Dir.glob('tasks/**/*.rake').each(&method(:import))