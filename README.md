# 创建 superset+mysql的docker镜像

## 运行
1. 生成superset镜像
```
docker build -t superset:dockerfile-built .
```

2. 构建superset和mysql组合镜像，并启动
```
docker-compose -p superset-mysql up -d
```

3. 使用superset<br>
在浏览器输入localhost:8088(或者反向代理的域名)，进入superset页面，输入账户和密码（admin：admin），开始使用superset


