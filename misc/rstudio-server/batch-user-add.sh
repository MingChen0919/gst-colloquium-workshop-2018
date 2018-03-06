# create 60 new users
for id in $(seq 1 60)
do
  echo "gst_user_${id}:passwd_user_${id}::::/home/gst_user_${id}:" | newusers
done
