FROM ubuntu:18.04
COPY test.py /
RUN  apt-get update \
##################################################################
#
# install utilities
  && apt-get install -y vim curl unzip \
#
# install python and libraries
  && apt-get install -y python python-pip \
  && pip install selenium PyVirtualDisplay \
#
# install libraries that chrome needs in order to run headless
  && apt-get install -y xvfb libxi6 libgconf-2-4 \
#
# install chrome stable  
  && curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add \
  && echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get -y update \
  && apt-get -y install google-chrome-stable \
#
# install chromedriver
  && curl https://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip -o chromedriver_linux64.zip \
  && unzip chromedriver_linux64.zip \
  && mv chromedriver /usr/bin/chromedriver \
  && chown root:root /usr/bin/chromedriver \
  && chmod +x /usr/bin/chromedriver \
#  
# create chrome user (cannot run chrome as root)
  && /usr/sbin/useradd --create-home --home-dir /home/chrome -c "chrome account" chrome \
  && chown -R chrome:chrome /home/chrome \
  && chown chrome:chrome test.py \
##########################
# cleanup install packages  
  && rm -rf /var/lib/apt/lists/* \
  && rm -f chromedriver_linux64.zip \
##########################
ENTRYPOINT bash  
