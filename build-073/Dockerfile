FROM aguamala/centos:7
MAINTAINER "gabo" <aguamala@deobieta.com>

ENV TERRAFORM_VERSION=0.7.3
ENV TERRAFORM_SHA256SUM=4e985f222ec99616e8c730d737c9b400f9d73bf0c436661ec888b2406d3a6f39

RUN yum install -y git curl && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -c terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    yum remove -y git && \
    yum clean all

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["plan"]
ENTRYPOINT ["/entrypoint.sh"]
