FROM apache/superset


# 切换用户为root
USER root
# 安装mysql依赖


RUN pip install mysqlclient
RUN pip install sqlalchemy-redshift
RUN apt-get update && apt-get install vim -y


# 创建环境变量文件
COPY ./pythonpath/* /app/pythonpath
# COPY ./images/logo.png /app/superset/static/assets/images/miracleplus-logo.png


# 切换回superset用户， 切回原因是superset命令只在这个用户里面可以用
USER superset
# 启动时执行
ENTRYPOINT ["sh", "-c", "superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin && \
              superset db upgrade && \
              superset init && \
              sh -c /usr/bin/run-server.sh"]
