# sThis file contains some useful command, what I used during GCLOUD computing

### Select project
`gcloud config set project cloud-computing-class-306811`

### List buckets
`gsutil ls`

Set/Get/Update bucket label

`gsutil label set <label-json-file> gs://<bucket_name>...`  
`gsutil label get gs://<bucket_name>`  
`gsutil label ch <label_modifier>... gs://<bucket_name>...`  
