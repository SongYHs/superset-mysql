
import pymysql
import pymysql.cursors


# 1.链接mysql服务端
ti_obj = pymysql.connect(
    host='127.0.0.1',             # MySQL服务端的ip地址
    port=3306,                    # MySQL默认的port地址(端口号)
    user='root',                  # 用户名
    passwd='123456',               # 密码
    database='dev',               # 库名
    charset='utf8'                # 字符编码 类型
)
# 2.获取光标原来是元组格式转换为字典格式更佳精确
cursor = ti_obj.cursor(
    cursor=pymysql.cursors.DictCursor    # 获取光标 并转换为字典格式
)
# 3.编写sql语句
sql1 = "select * from logs limit 10"
res = cursor.execute(sql1)
# 5.获取结果
res = cursor.fetchall()
print(res)
