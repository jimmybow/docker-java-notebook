FROM jupyter/base-notebook:notebook-5.7.8

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

## install basic python packages
RUN pip install --upgrade pip 
RUN pip install numpy pandas
RUN pip install argon2-cffi==20.1.0 
RUN pip install markupsafe==2.0.1
RUN pip install jupyterlab==2.2.2
  
## Install jupyter RISE extension.
RUN pip install terminado --ignore-installed
RUN pip install jupyter-nbextensions-configurator==0.4.1
RUN pip install jupyter_contrib-nbextensions==0.5.1 \
  && jupyter contrib nbextension install --system \
  && jupyter nbextension enable hide_input/main

## install beakerx func
RUN pip install beakerx beakerx_kernel_autotranslation beakerx_tabledisplay; \
  beakerx_kernel_autotranslation install; \
  beakerx_tabledisplay install;

# install groovy
RUN pip install beakerx_kernel_groovy; \
    beakerx_kernel_groovy install;

# install scala
RUN pip install beakerx_kernel_scala; \
    beakerx_kernel_scala install;
  
# Set user back to priviledged user.
RUN mkdir -p /home/$NB_USER/.ipython && chown -R $NB_USER /home/$NB_USER/.ipython
RUN mkdir -p /home/$NB_USER/.local && chown -R $NB_USER /home/$NB_USER/.local
USER $NB_USER
WORKDIR /home/$NB_USER