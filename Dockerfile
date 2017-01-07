FROM python:2.7-slim
MAINTAINER Hamilton Turner <hamiltont@gmail.com>

# Yay devcron
RUN pip install https://bitbucket.org/dbenamy/devcron/get/tip.tar.gz

# Setup defaults
RUN mkdir /cron && \
    echo "* * * * * /cron/sample.sh" > /cron/crontab && \
    echo "echo hello world" > /cron/sample.sh && \
    chmod a+x /cron/sample.sh
    
#install sqlite3
RUN apt-get update && \
apt-get install sqlite3

VOLUME ["/cron"]

CMD ["devcron.py", "/cron/crontab"]
