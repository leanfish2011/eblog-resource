# eblog简介
- 一个简洁的博客系统
- 界面简洁、代码简洁、占用资源少
- 适用于个人博客

## 展示
#### 主页
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/index.jpg" width="100%">

#### 博客浏览
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/view.jpg" width="100%">

#### 归档
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/archive.jpg" width="100%">

#### 项目
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/project.jpg" width="100%">

#### 工具
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/tool.jpg" width="100%">

#### 关于
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/about.jpg" width="100%">

#### 管理-博客列表
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/list.jpg" width="100%">

#### 管理-博客新建
<img decoding="async" src="https://raw.githubusercontent.com/leanfish2011/eblog-resource/main/img/post.jpg" width="100%">

## 部署
> 一键部署
#### 部署说明：
1. 选择装有Linux操作系统的服务器（例如Ubuntu系统）
2. 服务器安装好docker。Ubuntu安装docker命令：sudo apt-get update && sudo apt install docker.io
3. 拷贝[deploy.sh](https://github.com/leanfish2011/eblog-resource/blob/main/deploy/all_in_one/deploy.sh)、镜像tar包到服务器，tar包下载地址：[百度网盘下载地址](https://pan.baidu.com/s/1anG4Bb47q3T-h1zMeJQtyw) 提取码: ssea
4. 服务器上执行./deploy.sh，看日志提示安装完成
5. 浏览器输入 http://ip 可访问系统。浏览器输入 http://ip:9000 可访问容器管理界面

### 开发
#### 代码

|  服务   | 代码  | 备注  |
|  ----  | ----  | ----  |
| 前端界面  | [eblog-web](https://github.com/leanfish2011/eblog-web) | 界面展示 |
| 博客管理  | [eblog-post](https://github.com/leanfish2011/eblog-post) | 博客发布等功能管理 |
| 资料管理  | [eblog-resource](https://github.com/leanfish2011/eblog-resource) | 系统资料 |
| 公共后端  | [spring-dev-parent](https://github.com/leanfish2011/spring-dev-parent) | 后端开发公共服务 |

1. 下载上述代码
2. 可选择使用docker，或者本地安装mariadb、nginx
3. mariadb、nginx可以使用eblog-resource中的镜像
4. 建库sql语句在eblog-post工程中，也可以运行镜像


联系我：leanfish2011@163.com
