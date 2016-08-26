FROM hashicorp/terraform:0.7.2
MAINTAINER "gabo" <aguamala@deobieta.com>

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["terraform","plan","-module-depth=-1"]
