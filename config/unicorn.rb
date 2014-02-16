if ENV['RDEBUG'] == '1'
  puts 'Starting with single process and long timeout'
  worker_processes 1
  timeout 60 * 60 * 24 * 30
else
  worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
  timeout 15
end

preload_app true

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