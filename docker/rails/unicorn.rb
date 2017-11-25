worker_processes 3

pid '/var/run/unicorn.pid'
listen '/share/unicorn.sock'

timeout 30

stdout_path './log/unicorn.stdout.log'
stderr_path './log/unicorn.stderr.log'
