

获取本机 ip 的 server, 功能与 4.icanhazip.com 等网站类似， 在 vps 搭建


```bash
docker build . -t ip-service
docker run --name ip-service -idt --restart=always -p 8080:8080 ip-service 
```

