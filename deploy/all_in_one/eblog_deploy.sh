#!/bin/bash
# 作用：
# 1、服务器执行，进行镜像全量部署

# -------------------------------项目相关变量 start---------------------------
# 整个项目镜像tar包
image_name="eblog_all_20230408_162111.tar"

# 各个服务对应镜像
image_portainer="portainer:20200329_212642"
image_eblog_mariadb_infra="mariadb:20200329_204923"
image_eblog_nginx_infra="eblog_nginx_infra:v1.0_main_20230408_160147_a628b56"
image_eblog_post_mariadb_init="eblog_post_mariadb_init:v1.0_main_20230408_145543_660a1e9"
image_eblog_post_service="eblog-post:v1.0_main_20230408_144541_660a1e9"
image_eblog_web="eblog-web:v1.0_dev_20230408_145938_0a6176f"

# 挂载目录
data_path="/home/yufei/eblog/volumn"

# -------------------------------项目相关变量 end---------------------------

# 生成全局密码
global_password=$(date +%s%N|md5sum|head -c 10)
echo $global_password

echo "加载tar包"
sudo docker load -i $image_name

# -------------------------------开始部署-------------------------------
echo "开始部署……"
echo "0、portainer docker管理镜像启动，端口：9000"
sudo docker run -d --net=host \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name portainer \
  -e TZ=Asia/Shanghai \
  $image_portainer

echo "1、mariadb 基础服务镜像启动，端口：3306"
sudo docker run -d --net=host \
  --restart always \
  -v $data_path"/mariadb":/var/lib/mysql \
  --name eblog_mariadb_infra \
  -e MYSQL_ROOT_PASSWORD=$global_password \
  -e TZ=Asia/Shanghai \
  $image_eblog_mariadb_infra

echo "2、nginx 基础服务镜像启动，端口：80"
sudo docker run -d --net=host \
  --restart=always \
  -v $data_path"/nginx/web":/usr/share/nginx/html \
  -v $data_path"/nginx/log":/var/log/nginx \
  --name eblog_nginx_infra \
  $image_eblog_nginx_infra

echo "部署中……"
sleep 1m

echo "3、mariadb post 初始化镜像启动"
sudo docker run -d --net=host \
  -v $data_path"/init/mariadb/backup":/home/mysql/backup \
  --name eblog_post_mariadb_init \
  -e MYSQL_ROOT_PASSWORD=$global_password \
  $image_eblog_post_mariadb_init

echo "部署中……"
sleep 1m

echo "4、post 服务启动，端口：9091"
sudo docker run -d --net=host \
  --restart always \
  --name eblog_post_service \
  -e MAIL_PASSWORD=code \
  -e HOME_SITE_ADDRESS=code \
  -e HOME_SITE_PUB_SWITCH=true \
  -e ANALYZE_API_APP_ID=code \
  -e ANALYZE_API_API_KEY=code \
  -e ANALYZE_API_SECRET_KEY=code \
  -e MYSQL_ROOT_PASSWORD=global_password \
  $image_eblog_post_service

echo "5、前端镜像启动"
sudo docker run -d --net=host \
  --name eblog_web \
  -v $data_path"/nginx/web":/opt/project/web \
  $image_eblog_web

echo "部署中……"
sleep 1m

echo "镜像部署完成，请在浏览器中输入ip访问！"