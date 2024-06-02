# Base image
FROM centos:8

# Update repository URLs
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Execute commands as the root user
USER root

# Switch from CentOS Linux to CentOS Stream and install necessary packages
RUN dnf install -y centos-release-stream && \
    dnf swap -y centos-linux-repos centos-stream-repos && \
    dnf distro-sync -y && \
    dnf -y install epel-release && \
    dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
    dnf module enable php:remi-7.3 -y && \
    dnf install -y php php-cli php-common && \
    dnf install -y mariadb-server wget expect

# Add the script files to the image
COPY mariadb.sh /usr/local/bin/mariadb.sh
COPY configuredb.sh /usr/local/bin/configuredb.sh
COPY mediawiki.sh /usr/local/bin/mediawiki.sh
# Make the script files executable
RUN chmod +x /usr/local/bin/mariadb.sh /usr/local/bin/configuredb.sh /usr/local/bin/mediawiki.sh

# Enable MariaDB and Apache services
RUN systemctl enable mariadb && \
    systemctl enable httpd

CMD ["tail", "-f", "/dev/null"]
