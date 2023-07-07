### This file contains some useful command what I used during my container development

---
#### List Container IP Address
Alias cmd: `dockerip`

behind the alias `docker ps | tail -n +2 | while read cid b; do echo -n "($cid): "; docker inspect $cid | grep "IPAddress" | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}';  done`

#### Others

`
docker network ls
`
