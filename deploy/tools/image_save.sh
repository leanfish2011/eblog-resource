#!/bin/bash
# 作用：
# 1、多个镜像打包

# -------------------------------项目相关变量 start---------------------------

# 各个服务对应镜像
image_portainer="portainer:20200329_212642"
image_eblog_mariadb_infra="mariadb:20200329_204923"
image_eblog_nginx_infra="eblog_nginx_infra:v1.0_main_20230408_160147_a628b56"
image_eblog_post_mariadb_init="eblog_post_mariadb_init:v1.0_main_20230408_145543_660a1e9"
image_eblog_post_service="eblog-post:v1.0_main_20230408_144541_660a1e9"
image_eblog_web="eblog-web:v1.0_dev_20230408_145938_0a6176f"

time_now=$(date "+%Y%m%d_%H%M%S")
tar_name="eblog_all_"$time_now".tar"
sudo docker save -o $tar_name $image_portainer $image_eblog_mariadb_infra $image_eblog_nginx_infra $image_eblog_post_mariadb_init $image_eblog_post_service $image_eblog_web

echo "镜像打包完成"$tar_name