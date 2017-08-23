ERROR_MSG=`redis-cli -p 7600 ping` 2> /dev/null
if [ "$ERROR_MSG" != "PONG" ]
then
  redis-server --port 7600 --daemonize yes
fi
