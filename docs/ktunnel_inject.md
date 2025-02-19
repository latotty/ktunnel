## ktunnel inject

Inject server sidecar to the cluster and run the ktunnel client to establish a connection

### Synopsis

This command accepts a pod/deployment and injects the tunnel sidecar to that artifact, 
			it then establishes a reverse tunnel

### Options

```
  -c, --ca-file string                TLS cert auth file
  -h, --help                          help for inject
  -n, --namespace string              Namespace (default "default")
  -s, --scheme string                 Connection scheme (default "tcp")
  -o, --server-host-override string   Server name use to verify the hostname returned by the TLS handshake
```

### Options inherited from parent commands

```
  -p, --port int   The port to use to establish the tunnel (default 28688)
  -t, --tls        Connection uses tls if true, else plain TCP
  -v, --verbose    verbose mode
```

### SEE ALSO

* [ktunnel](ktunnel.md)	 - Ktunnel is a network tunneling tool for kubernetes
* [ktunnel inject deployment](ktunnel_inject_deployment.md)	 - Inject server sidecar to a deployment and run the ktunnel client to establish a connection

###### Auto generated by spf13/cobra on 30-Oct-2021
