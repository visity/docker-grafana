# Usage
This grafana docker is a 1-1 derivative of the grafana/grafana docker but with jessie as root docker and an explicit version reference. This repo will be discontinued when that docker is updated to jessie as well. Please see https://hub.docker.com/r/grafana/grafana/ for more info.

When you run the grafana and login as admin/admin you can add the graphite datasource simply by using the named graphiteweb docker.

So if the graphiteweb docker was started by:

	docker run -d --name graphiteweb --link carbon --volumes-from carbon -p 80:80 visity/graphiteweb
	
Grafana can simply link to the datastore by using the 'graphiteweb' name.
