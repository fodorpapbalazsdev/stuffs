#### This file contains some usefull command what I used during my container development

---
### List Container IP Address

`
docker network ls
`

```
docker network inspect -f \
'{{json .Containers}}' f984d187c1e8 | \
jq '.[] | .Name + ":" + .IPv4Address'
```

---
