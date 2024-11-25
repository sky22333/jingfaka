### 鲸发卡v11.61

源码来自：https://github.com/mrlihx/JingFaka_Happy

[鲸发卡官方文档](https://itlanjing.feishu.cn/docs/doccnWnkDiCaf5Hz9BLP092Dnzd)

[鲸发卡官方文档New](https://itlanjing.feishu.cn/docs/doccnz1GgIk19o8d1F5ylG6cs9b#Yks5Dl)

> 安装
1. 上传所有文件到服务器 或者宝塔
2. 伪静态thinkphp，php版本为7.0
3. `/install` 安装路径
4. 后台路径 `/admin`
5. 系统命令：`php think Tools`
6. 易支付对接地址示例：`https://pay.example.com/submit.php`
7. 支付类型只能删除和增加，编辑是无效的

### 定时任务计划设置
进入宝塔控制面板-----计划任务  填写计划任务

1. 解冻任务 设置时间每小时第2分钟 执行

    **`cd /www/wwwroot/jingfaka`**

    **`php think UnfreezeMoney`**

2. 提现任务 设置时间每小时第5分钟 执行

   **`cd /www/wwwroot/jingfaka`**

   **`php think AutoCash`**

3. 3天没有支付的订单视为无效 建议执行时间为 1天一次

   **`cd /www/wwwroot/jingfaka`**

   **`php think AutoClearExpireOrder`**

4. 自动清理删除超过十五天的商品 建议执行时间1天一次

   **`cd /www/wwwroot/jingfaka`**

   **`php think AutoEmptyGoodsTrash`**


<details>
  <summary>Docker-compose</summary>

```
services:
  jingfaka:
    image: ghcr.io/sky22333/jingfaka
    ports:
      - "8080:80"
    depends_on:
      - mysql
    restart: always
    environment:
      - TZ=Asia/Shanghai

  mysql:
    image: mysql:5.7
    container_name: mysql
    environment:
      - MYSQL_ROOT_PASSWORD=jingfaka7890
      - MYSQL_DATABASE=jingfaka
      - MYSQL_USER=jingfaka
      - MYSQL_PASSWORD=jingfaka7890
    restart: always
    volumes:
      - ./mysql_data:/var/lib/mysql
```


</details>

