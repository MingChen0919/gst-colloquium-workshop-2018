# Jetstream RStudio server setting up


```
# switch to sudo user
sudo su
# luanch RStudio
docker run -d -p 8787:8787 -v $(pwd)/my-project:/home/rstudio/my-project rocker/rstudio
```

```
# create 60 new users
for id in $(seq 1 60)
do
  echo "gst_user_${id}:passwd_user_${id}::::/home/gst_user_${id}:" | newusers
done
```