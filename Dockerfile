FROM dapiaoliang666/php-apache:7.0

# 安装必要的工具
RUN apt-get update && apt-get install -y \
    cron \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 启用 Apache 重写模块
RUN a2enmod rewrite

# 设置工作目录
WORKDIR /var/www/html

# 复制项目文件
COPY . /var/www/html/

# 配置 Apache 虚拟主机
RUN echo '<VirtualHost *:80>\n\
    DocumentRoot /var/www/html/public\n\
    <Directory "/var/www/html/public">\n\
        Options FollowSymLinks\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

# 创建计划任务配置
RUN echo "2 * * * * www-data cd /var/www/html && php think UnfreezeMoney > /proc/1/fd/1 2>/proc/1/fd/2\n\
5 * * * * www-data cd /var/www/html && php think AutoCash > /proc/1/fd/1 2>/proc/1/fd/2\n\
0 0 * * * * www-data cd /var/www/html && php think AutoClearExpireOrder > /proc/1/fd/1 2>/proc/1/fd/2\n\
0 0 * * * * www-data cd /var/www/html && php think AutoEmptyGoodsTrash > /proc/1/fd/1 2>/proc/1/fd/2\n" > /etc/cron.d/thinkphp-cron

# 设置计划任务文件权限
RUN chmod 0644 /etc/cron.d/thinkphp-cron

# 创建启动脚本
RUN echo '#!/bin/sh\n\
cron\n\
apache2-foreground' > /usr/local/bin/docker-entrypoint.sh \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

# 设置目录权限
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# 设置入口点
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
