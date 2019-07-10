## Install Helm
```
$ kubectl create -f helm-rbac.yaml
$ helm init --service-account tiller
```

## Install Consul
```
$ git clone https://github.com/hashicorp/consul-helm.git
$ helm install -f helm-consul-values.yaml ./consul-helm
```

## delete consul:
```
helm del --purge consul
```

## Enable stub-dns
```
$ bin/enable-consul-stub-dns.sh consul-dns
```

## DEMO: See running pods
See running pods and Fabio port
```
$ kubectl get pods
$ kubectl get svc
```

## DEMOA: Deploy a HelloWorld application with Host routing hello.com
```
$ vi helloworld.yaml
$ kubectl apply -f helloworld.yaml
$ kubectl get pods
$ curl http://api.vanille.jba.docker.support:32080 -H "Host: hello.com"
 
```

## DEMOB: Deploy a second HelloWorld application with Host routing helloV2.com
```
$ vi helloworldv2.yaml
$ kubectl apply -f helloworldv2.yaml
$ kubectl get pods
$ curl http://api.vanille.jba.docker.support:32080 -H "Host: hellov2.com"
```

## DEMOC: Update the second deployment
```
$ vi helloworldv2bis.yaml
$ kubectl apply -f helloworldv2bis.yaml
$ kubectl get pods
$ curl http://api.vanille.jba.docker.support:32080 -H "Host: hellov2.com"
```

## List registered services
```
$ kubectl get pods
$ kubectl exec -it consul-xmq29 /bin/sh
/ # curl http://127.0.0.1:8500/v1/agent/services | jq
```

## Deregister a service from Consul
```
kubectl exec -it consul-xmq29 /bin/sh
/ # curl --request PUT   http://127.0.0.1:8500/v1/agent/service/deregister/hello-5bbfb49d8b-zbtjg
```

## Create an application that uses Consul service discovery
```
$ kubectl create -f 02-yaml-discovery/
```

