require 'rake/testtask'

namespace :heroku do
  task :upload_config do
    vars = []
    File.open(".env", "r").each_line do |line|
      vars.push line.strip if line.length
    end
    sh 'heroku config:set ' +  vars.join(' ')
  end
end

Rake::TestTask.new do |t|
    t.libs = ['spec', 'lib']
    t.test_files = Dir['spec/**/*_spec.rb']
end
