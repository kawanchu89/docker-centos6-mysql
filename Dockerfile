FROM --platform=linux/x86_64 centos:6

# 日本語対応, タイムゾーン設定
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ENV LANG="ja_JP UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8" \
    TZ="Asia/Tokyo"

# YUMが通るように変更
RUN cd /etc/yum.repos.d/ && \
    cp -p /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak && \
    sed -i -e "s/^mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i -e "s/^#baseurl=http:\/\/mirror.centos.org/baseurl=http:\/\/vault.centos.org/g" /etc/yum.repos.d/CentOS-Base.repo

# MySQLをインストール
RUN yum -y install mysql-server && \
    yum clean all

RUN /usr/bin/mysql_install_db --datadir="/var/lib/mysql" --user=mysql && \
    chown -R mysql:mysql "/var/lib/mysql"

# テストデータを読み込む
COPY ./init.sh /tmp
COPY ./init.sql /tmp
COPY ./aaa.sql /tmp/aaa.sql
RUN chmod +x /tmp/init.sh && \
    /tmp/init.sh && \
    rm /tmp/init.sql && \
    rm /tmp/aaa.sql && \
    rm /tmp/init.sh

EXPOSE 3306/tcp

CMD ["/usr/bin/mysqld_safe"]
