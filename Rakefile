require 'rake/testtask'

config = <<-eos
MONGO_URI=
TWILIO_SID=
TWILIO_TOKEN=
TWILIO_NUMBER=
eos

namespace :heroku do
  task :create_config do
    File.open('.env', 'w') { |file| file.write(config) } unless File.exist?('.env')
  end

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
