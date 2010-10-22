namespace :unicorn do
  def unicorn_start
#    sh 'unicorn_rails --path /dsp/api/v1.0 -c config/unicorn.conf -D -E development'
    sh 'unicorn_rails -c config/unicorn.conf -D -E development'
  end

  def check_pid
    if File.exists? 'tmp/pids/unicorn.pid'
      pid = File.read 'tmp/pids/unicorn.pid'
      pid.chop!

      running_pids = `ps ax | grep unicorn_rails | grep master | grep -v grep | gawk '{print $1}'`
      running_pids.chop!
      running_pids.split "\n"

      if running_pids.include? pid
        pid
      else
        $stderr.puts "[WARNING] pid file found but process not found."
        nil
      end
    else
      nil
    end
  end

  desc 'Start Unicorn server'
  task :start do
    unicorn_start
  end

  desc 'Stop Unicorn server'
  task :stop do
    return if (pid = check_pid).nil?
    sh "kill -QUIT #{pid}"
  end

  desc 'Restart Unicorn server'
  task :restart do
    if (pid = check_pid).nil?
      Rake::Task['unicorn:start'].invoke
    else
      sh "kill -USR2 #{pid}"
      sh "kill -QUIT #{pid}"
    end
  end

  desc 'Check Unicorn process'
  task :status do
    puts check_pid
  end
end
