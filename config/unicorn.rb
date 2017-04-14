root = "/home/developer/projects/sadhanamrita/current"
working_directory root

pid "#{root}/shared/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn_error.log"
stdout_path "#{root}/log/unicorn.log"

worker_processes 10 # Integer(ENV['WEB_CONCURRENCY'])
timeout 30
preload_app true

listen '#{root}/shared/unicorn.sock', backlog: 64

GC.copy_on_write_friendly = true if GC.respond_to?(:copy_on_write_friendly=) # Решительно не уверен, что значит эта строка, но я решил ее оставить.

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV['BUNDLE_GEMFILE'] = File.join(root, 'Gemfile')
end