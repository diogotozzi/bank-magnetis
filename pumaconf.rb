directory '/app'
threads 1, 4
workers 1
bind 'tcp://0.0.0.0:9292'
pidfile '/var/run/app/app.pid'
stdout_redirect '/var/log/app/app.log', '/var/log/app/app.log', true
daemonize false
