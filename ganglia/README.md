# Ganglia #

## Dependency ##

+ wookietreiber/ganglia

It can be found via `docker search ganglia`

## Run ##

+ docker run -d --name ganglia -p 2080:80 --link southport_container --rm wookietreiber/ganglia:latest

浏览器访问`http://0.0.0.0:2080/ganglia/`

## Deployment for client node ## 

+ apt update
+ apt-get install -y ganglia-monitor
+ vim /etc/ganglia/gmond.conf (change to "rotary-aqp")
+ service ganglia-monitor restart

## Deployment for server node ##

+ vim /etc/ganglia/gmetad.conf

change to `data_source rotary-aqp southport:8649`

