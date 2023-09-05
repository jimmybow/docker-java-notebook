FROM jupyter/base-notebook:notebook-5.7.8

MAINTAINER Jimmy jimmywu@bluetechnology.com.tw

USER root
WORKDIR /opt

# Install dependencies
RUN apt-get update; \
apt-get install curl wget zip unzip vim software-properties-common openjdk-11-jdk maven -y; \
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
RUN pip install terminado --ignore-installed
RUN pip install jupyterlab==3.6.5
RUN pip install ipywidgets==7.6.0
  
## Install jupyter extension.
RUN pip install jupyter-nbextensions-configurator==0.4.1
RUN pip install jupyter_contrib-nbextensions==0.5.1 \
  && jupyter contrib nbextension install --system \
  && jupyter nbextension install --sys-prefix --py jupyter_nbextensions_configurator --overwrite \
  && jupyter nbextension enable --sys-prefix --py jupyter_nbextensions_configurator \
  && jupyter nbextension enable hide_input/main

## install beakerx func
RUN pip install beakerx==2.0.0 beakerx_tabledisplay==2.0.0 beakerx_kernel_autotranslation==2.0.0; \
  beakerx install; \
  beakerx_tabledisplay install; \
  beakerx_kernel_autotranslation install;

# install groovy
RUN pip install beakerx_kernel_groovy; \
    beakerx_kernel_groovy install;

# install scala
RUN pip install beakerx_kernel_scala; \
    beakerx_kernel_scala install;
    
# install kotlin
RUN pip install beakerx_kernel_kotlin; \
    beakerx_kernel_kotlin install;

# install clojure
RUN pip install beakerx_kernel_clojure; \
    beakerx_kernel_clojure install;

# install sql
RUN pip install beakerx_kernel_sql; \
    beakerx_kernel_sql install;

# Set user back to priviledged user.
RUN mkdir -p /home/$NB_USER/.ipython && chown -R $NB_USER /home/$NB_USER/.ipython
RUN mkdir -p /home/$NB_USER/.local && chown -R $NB_USER /home/$NB_USER/.local
USER $NB_USER
WORKDIR /home/$NB_USER