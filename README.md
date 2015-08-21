# Usage
This grafana docker is a derivative of the grafana/grafana docker but with jessie as root docker, an explicit version reference, running grafana as non-root and reserved uid for volume shares. Please see https://hub.docker.com/r/grafana/grafana/ for more info.

When you run the grafana and login as admin/admin you can add the graphite datasource simply by using the named graphiteweb docker.

So if the graphiteweb docker was started by:

	docker run -d --name graphiteweb --link carbon --volumes-from carbon -p 80:80 visity/graphiteweb
	
Grafana can simply link to the datastore by using the 'graphiteweb' name from within the application (the web GUI).

