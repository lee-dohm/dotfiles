function stop-all-docker --description 'Gracefully shuts down all docker containers'
  docker stop (docker ps -a -q)
end
