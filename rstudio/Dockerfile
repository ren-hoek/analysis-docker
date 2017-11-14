FROM analysis/base

COPY install-packages.r /tmp/R/
RUN R -f /tmp/R/install-packages.r

RUN wget https://download2.rstudio.org/rstudio-server-1.1.383-amd64.deb
RUN gdebi --non-interactive rstudio-server-1.1.383-amd64.deb
RUN echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf
RUN echo "server-user=hitokage" >> /etc/rstudio/rserver.conf
EXPOSE 8787

ADD start-rserver.sh .
ENTRYPOINT ["tini", "--"]
CMD ["./start-rserver.sh"]
#CMD ["rstudio-server", "start"]
