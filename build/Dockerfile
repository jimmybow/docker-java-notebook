FROM jupyter/minimal-notebook:notebook-6.5.4

MAINTAINER Jimmy jimmywu@bluetechnology.com.tw

USER root
WORKDIR /opt

# Install dependencies
RUN apt-get update; \
apt-get install curl wget zip unzip vim software-properties-common openjdk-11-jdk -y; \
apt-get clean; \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

# Unpack and install the kernel
RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > ijava-kernel.zip
RUN unzip ijava-kernel.zip -d ijava-kernel; \
  rm ijava-kernel.zip; \
  cd ijava-kernel; \
  python3 install.py --sys-prefix;

# Install jupyter RISE extension.
RUN pip install jupyter_contrib-nbextensions RISE \
  && jupyter-nbextension install rise --py --system \
  && jupyter-nbextension enable rise --py --system \
  && jupyter contrib nbextension install --system \
  && jupyter nbextension enable hide_input/main
  
# Set user back to priviledged user.
RUN mkdir -p /home/$NB_USER/.ipython && chown -R $NB_USER /home/$NB_USER/.ipython
USER $NB_USER
WORKDIR /home/$NB_USER