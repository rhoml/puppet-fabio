# Add some readme

```
fabio::proxy_addr:
  - :9999
  - whatever
fabio::registry_static_routes:
  svc:
    '/ http://1.2.3.4:5000/'
fabio::config_hash:
  proxy:
    localip: "%{::ipaddress}"
    strategy: rnd
    matcher: prefix
    noreoutestatus: 404
    shutdownwait: '0s'
    timeout: '0s'
    dialtimeout: '30s'
    maxconn: 10000
  registry:
    backend: consul
  metrics:
    target: string
    prefix: default
    interval: '30s'
  runtime:
    gogc: 800
    gomaxprocs: '-1'
  ui:
    addr: ':9998'
    color: light-green
    title: gtau
fabio::header_clientip: "%{::ipaddress}"
fabio::header_tls: 'whatever'
fabio::header_tls_value: 'whatever'
fabio::registry_file_path: /whatever
fabio::consul_addr: localhost:8500
fabio::consul_token: whatever
fabio::consul_kvpath: /fabio/config
fabio::consul_tagprefix: urlprefix-
fabio::consul_register_enabled: true
fabio::consul_register_addr: ':9998'
fabio::consul_register_name: fabio
fabio::consul_register_tags: whatever
fabio::consul_register_checkinterval: '1s'
fabio::consul_register_checktimeout: '3s'
```
