FROM ubuntu

RUN sed -i.bak -e "s%http://[^ ]\+%http://ftp.tsukuba.wide.ad.jp/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt update
RUN apt upgrade
RUN apt install -y \
    python3-setuptools \
    python3-pip
RUN apt clean
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install --no-cache-dir \
    wheel \
    jupyter \
    matplotlib \
    numpy==1.13 \
    chainer==4.0.0

EXPOSE 8888

CMD ["jupyter", "notebook", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--ip=0.0.0.0"]

