### 鲸发卡v11.61
仅供学习使用，禁止商用，商用请购买[官方](https://www.jingsoft.com/)原版。

本仓库源码来自：https://github.com/mrlihx/JingFaka_Happy


> 安装
1. 上传所有文件到服务器 或者宝塔
2. 伪静态thinkphp，php版本为7.0
3. `/install` 安装路径
4. 后台路径 `/admin`
5. 系统命令：`php think Tools`
6. 易支付对接地址示例：`https://pay.example.com/submit.php`
7. 支付类型只能删除和增加，编辑是无效的



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

