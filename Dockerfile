FROM jupyter/pyspark-notebook

USER root

RUN apt-get update && \
    apt-get -qy install --reinstall build-essential && \
    apt-get -qy install gcc freetds-dev freetds-bin unixodbc-dev tdsodbc

RUN pip install --upgrade pip && \
    pip install pyodbc pymysql

ADD odbcinst.ini /etc/odbcinst.ini
RUN odbcinst -q -d -i -f /etc/odbcinst.ini
