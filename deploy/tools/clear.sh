#!/bin/bash

# 作用：
# 1、旧服务目录清理
# 2、旧服务停止

# 旧服务目录
data_path="/home/eblog/volumn"

# 项目全部容器
containers=(
    "portainer" 
    "eblog_mariadb_infra" 
    "eblog_nginx_infra" 
    "eblog_post_mariadb_init"  
    "eblog_post_service" 
    "eblog_web"
  );

# 确定
read -p "重新部署服务，之前的挂载、备份、容器都会清除，确定 (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "重新部署服务！";
else
  exit 1;
fi

# 清理挂载目录
echo "数据挂载目录："$data_path
echo "开始清除挂载目录数据……"
dataFile=$data_path"/*"
sudo rm -rf $dataFile
echo "挂载目录清理完成！"

# 清理容器
echo "开始删除旧的容器……"
for container in ${containers[@]}
do
    result=$(sudo docker ps -a | grep $container)
    if [[ -n $result ]]
    then
        echo "停止容器："
        sudo docker stop $container

        echo "删除容器："
        sudo docker rm $container
    else
        echo "容器："$container"不存在！"
    fi    
done
echo "旧的容器删除完成！"