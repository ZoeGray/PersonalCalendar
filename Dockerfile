FROM alpine AS builder

ENV JDK_VERSION 11
ENV ANT_VERSION 1.9.15
ENV WILDFLY_VERSION 22.0.1.Final
ENV MYSQL_CONNECTOR_VERSION 5.1.44

ENV ANT_HOME /opt/apache-ant
ENV WILDFLY_HOME /opt/wildfly
ENV COPYLIBSTASK_HOME /opt/netbeans
ENV MYSQL_CONNECTOR_HOME /opt/mysql
ENV ADMIN_USER admin
ENV ADMIN_PASS wildfly

# Get Java
RUN apk update && \
    apk add openjdk$JDK_VERSION && \
    rm -rf /var/cache/apk/*

# Get Apache Ant
RUN wget http://www.us.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar zxvf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mkdir -p $ANT_HOME && \
    cp -Rvf apache-ant-${ANT_VERSION}/* $ANT_HOME && \
    rm -rf apache-ant-${ANT_VERSION} apache-ant-${ANT_VERSION}-bin.tar.gz

# Get Wildfly
RUN wget http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz && \
    tar zxvf wildfly-$WILDFLY_VERSION.tar.gz && \
    mkdir -p $WILDFLY_HOME && \
    cp -Rvf wildfly-$WILDFLY_VERSION/* $WILDFLY_HOME && \
    rm -rf wildfly-$WILDFLY_VERSION wildfly-$WILDFLY_VERSION.tar.gz && \
    $WILDFLY_HOME/bin/add-user.sh $ADMIN_USER $ADMIN_PASS

# Get NetBeans copylibstask jarfile
RUN mkdir -p $COPYLIBSTASK_HOME && \
    wget http://www.java2s.com/Code/JarDownload/org-netbeans/org-netbeans-modules-java-j2seproject-copylibstask.jar.zip && \
    unzip org-netbeans-modules-java-j2seproject-copylibstask.jar.zip && \
    mv org-netbeans-modules-java-j2seproject-copylibstask.jar $COPYLIBSTASK_HOME/org-netbeans-modules-java-j2seproject-copylibstask.jar

# Get MySQL JDBC connector
RUN wget https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz && \
    tar zxvf mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz && \
    mkdir -p $MYSQL_CONNECTOR_HOME && \
    mv mysql-connector-java-$MYSQL_CONNECTOR_VERSION/mysql-connector-java-$MYSQL_CONNECTOR_VERSION-bin.jar $MYSQL_CONNECTOR_HOME/mysql-connector-java-$MYSQL_CONNECTOR_VERSION-bin.jar

ENV PATH $PATH:$ANT_HOME/bin

# Copy and build sourcecode
WORKDIR /code
COPY ./ .
RUN ant -Dj2ee.server.home=$WILDFLY_HOME -Dlibs.CopyLibs.classpath=$COPYLIBSTASK_HOME/org-netbeans-modules-java-j2seproject-copylibstask.jar

#---------------------------

FROM alpine

ENV JDK_VERSION 11
ENV WILDFLY_HOME /opt/wildfly

RUN apk update
RUN apk add openjdk$JDK_VERSION
RUN rm -rf /var/cache/apk/*

COPY --from=builder $WILDFLY_HOME $WILDFLY_HOME
COPY --from=builder /code/dist $WILDFLY_HOME/standalone/deployments/.
COPY bootstrap.sh /bootstrap.sh

RUN chmod +x /bootstrap.sh

CMD ["/bootstrap.sh"]
