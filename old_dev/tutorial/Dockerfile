FROM ubuntu:18.04
LABEL maintainer="David Whiting <david.whiting@h2o.ai>"

## Below ENV only used when needed in the image. ARG is 
## available during build but will not be set in final 
## image.

#ENV BASE=/home/h2o/bin

##############################
## Versioning information
##   Update these values and (hopefully) everything
##   will run correctly below. YMMV.


#ARG RSTUDIO_VERSION=1.2.1335
#ARG RSTUDIO_VERSION=1.2.5033
#
#ENV CONDA_PYTHON_H2O=3.6
#
#ARG H2O_BRANCH_NAME=yau
#ARG H2O_MAJOR_VERSION=3.26.0
#ARG H2O_BUILD_NUMBER=5

################################################
##### DON'T CHANGE ARG OR ENV BELOW ############

ENV CONDA_HOME=${BASE}/miniconda3
#
## To keep tzdata from requesting time zones interactively
#ARG DEBIAN_FRONTEND=noninteractive
#
#ARG RSTUDIO=rstudio-server-${RSTUDIO_VERSION}-amd64.deb

ARG MINICONDA_FILE=Miniconda3-latest-Linux-x86_64.sh
ARG CONDA=${CONDA_HOME}/bin/conda

#ARG H2O_S3_PATH=http://h2o-release.s3.amazonaws.com/h2o
#ARG H2O_PROJECT_VERSION=${H2O_MAJOR_VERSION}.${H2O_BUILD_NUMBER}
#ARG H2O_DIRECTORY=h2o-${H2O_PROJECT_VERSION}
#ARG JUPYTER=${CONDA_HOME}/envs/h2o/bin/jupyter

#########################################

## Linux
RUN \
  apt-get -y update \
  && apt-get -y upgrade \
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt-get -y install \
        apache2 \
        apache2-dev \
        mysql-client \
        mysql-server \
        python3.6 \
        python3.6-dev \
        vim \
        wget

RUN \
  curl https://bootstrap.pypa.io/get-pip.py | python3.6 \
  && pip3.6 install mod_wsgi \
  && mod_wsgi-express module-config



        apt-transport-https \
        apt-utils \
        software-properties-common \
        bzip2 \
        cpio \
        curl \
        dirmngr \
        gdebi-core \
        git \
        graphviz \
        libcurl4-nss-dev \
        locales \
        net-tools \
        nginx \
        sudo \
	systemd \
        vim \
        wget \
        zip \
  && locale-gen en_US.UTF-8 \
  && update-locale LANG=en_US.UTF-8 

# Install Java 8
RUN \
  apt-get -y install \
        openjdk-8-jre \
        openjdk-8-jdk 

# Install R 3.6
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
  && sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' \
  && apt-get -y update \
  && apt-get -y install \
        r-base \
        r-base-dev \
  && R -e 'chooseCRANmirror(graphics=FALSE, ind=1);install.packages(c("RCurl","jsonlite","ggplot2"));' \
  && mkdir -p /usr/local/lib/R/site-library \
  && chmod 777 /usr/local/lib/R/site-library 

# Markdown for RStudio
RUN \
  R -e 'chooseCRANmirror(graphics=FALSE, ind=1);install.packages(c("evaluate","highr","markdown","yaml","htmltools","knitr","based64enc","rprojroot","mime","rmarkdown"))' 

# R packages for Dave Engler Contents
RUN \
  R -e 'chooseCRANmirror(graphics=FALSE, ind=1);install.packages(c("tidyr","readr","lubridate","dplyr"))' 

# RStudio Install
RUN \
  wget https://download2.rstudio.org/server/trusty/amd64/${RSTUDIO} \
  && gdebi --non-interactive ${RSTUDIO} \
  && echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf \
  && rm ${RSTUDIO} 

# Log directory used by run.sh
RUN \
  mkdir /log \
  && chmod o+w /log

# IRKernel for R in Jupyter
RUN \
  apt-get -y update \
  && apt-get -y install \
        libzmq3-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        jupyter-core \
        jupyter-client \
  && R -e 'chooseCRANmirror(graphics=FALSE, ind=1);install.packages(c("repr", "IRdisplay", "IRkernel"), type = "source")' \
  && R -e 'IRkernel::installspec(user = FALSE)'

# Configure nginx
COPY templates/nginx/nginx.conf /etc/nginx/nginx.conf
COPY templates/nginx/sites-available/training /etc/nginx/sites-available/training
RUN \
  rm -f /etc/nginx/sites-available/default \
  && ln -s /etc/nginx/sites-available/training /etc/nginx/sites-enabled/training  

#######################
# ----- USER H2O -----
#######################

RUN \
  useradd -ms /bin/bash h2o && \
  usermod -a -G sudo h2o && \
  echo "h2o:h2o" | chpasswd && \
  echo 'h2o ALL=NOPASSWD: ALL' >> /etc/sudoers

USER h2o
WORKDIR /home/h2o

# Install Miniconda
RUN \
  wget https://repo.anaconda.com/miniconda/${MINICONDA_FILE} \
  && bash ${MINICONDA_FILE} -b -p ${CONDA_HOME} \
  && ${CONDA} update -n base -c defaults conda \
  && rm ${MINICONDA_FILE}

# Install H2O
RUN \
  ${CONDA} create -y --name h2o python=${CONDA_PYTHON_H2O} jupyter requests matplotlib pandas xlrd seaborn \
  && wget ${H2O_S3_PATH}/rel-${H2O_BRANCH_NAME}/${H2O_BUILD_NUMBER}/h2o-${H2O_PROJECT_VERSION}.zip \
  && unzip ${H2O_DIRECTORY}.zip \
  && rm ${H2O_DIRECTORY}.zip \
  && bash -c "source ${CONDA_HOME}/bin/activate h2o && pip install ${H2O_DIRECTORY}/python/h2o*.whl tqdm graphviz shap xgboost datatable plotly" \
  && ${JUPYTER} notebook --generate-config \
  && sed -i "s/#c.NotebookApp.token = '<generated>'/c.NotebookApp.token = 'h2o'/" /home/h2o/.jupyter/jupyter_notebook_config.py \
  && R CMD INSTALL ${H2O_DIRECTORY}/R/h2o*.gz \
  && rm -rf ${H2O_DIRECTORY}

# Entry point (run.sh)
COPY templates/docker/run_with_flow.sh /run.sh

######


## Replace template variables with their values
RUN \
   sudo chmod a+x /run.sh \
   && sudo sed -i "s|(CONDA_HOME)|$CONDA_HOME|" /run.sh

# https://support.rstudio.com/hc/en-us/articles/200552326-Running-RStudio-Server-with-a-Proxy
# https://nathan.vertile.com/blog/2017/12/07/run-jupyter-notebook-behind-a-nginx-reverse-proxy-subpath/
RUN \
  sed -i "s/#c.NotebookApp.base_url = '\/'/c.NotebookApp.base_url = '\/jupyter'/" /home/h2o/.jupyter/jupyter_notebook_config.py \
  && sed -i "s/#c.NotebookApp.allow_origin = ''/c.NotebookApp.allow_origin = '*'/" /home/h2o/.jupyter/jupyter_notebook_config.py 

## Create link for ease of use in jupyter notebooks import command
COPY --chown=h2o templates/aquarium_startup bin/aquarium_startup
COPY --chown=h2o templates/aquarium_stop bin/aquarium_stop

RUN \
  bash -c "ln ${CONDA_HOME}/envs/h2o/lib/python${CONDA_PYTHON_H2O}/site-packages/h2o/backend/bin/h2o.jar ${BASE}" \
  && chmod +x ${BASE}/aquarium_startup \
  && chmod +x ${BASE}/aquarium_stop

#RUN \
#  mkdir /home/h2o/zeppelin 
#\
#  && bash -c "sudo /usr/sbin/service nginx reload" \
#  && bash -c "sudo /usr/sbin/service nginx restart" 

## Install and enable Jupyter Extensions
RUN \
  bash -c "source ${CONDA_HOME}/bin/activate h2o && pip install jupyter_contrib_nbextensions" \
  && ${JUPYTER} contrib nbextension install --user \
  && ${JUPYTER} nbextension enable codefolding/main \
  && ${JUPYTER} nbextension enable collapsible_headings/main \
  && ${JUPYTER} nbextension enable code_font_size/code_font_size \
  && ${JUPYTER} nbextension enable codefolding/edit \
  && ${JUPYTER} nbextension enable freeze/main \
  && ${JUPYTER} nbextension enable hide_header/main \
  && ${JUPYTER} nbextension enable hide_input/main \
  && ${JUPYTER} nbextension enable python-markdown/main \
  && ${JUPYTER} nbextension enable exercise2/main \
  && ${JUPYTER} nbextension enable rubberband/main

# /home/h2o/bin/miniconda3/envs/h2o/lib/python3.6/site-packages/jupyter_contrib_nbextensions/nbextensions/codefolding


# R packages for Dave Engler Contents (these didn't work above)
RUN \
  R -e 'chooseCRANmirror(graphics=FALSE, ind=1);install.packages(c("plotly","TSstudio"))' 

# Add Autodoc
ARG PANDOCPATH=https://github.com/jgm/pandoc/releases/download/2.9.1.1
ARG PANDOC=pandoc-2.9.1.1-1-amd64.deb
ARG AUTODOCPATH=https://s3.amazonaws.com/artifacts.h2o.ai/snapshots/ai/h2o/ml_autodoc/0.0.1-104/dist
ARG AUTODOC=ml_autodoc-0.0.1-cp36-cp36m-linux_x86_64.whl

RUN \
  wget ${PANDOCPATH}/${PANDOC} \
  && sudo dpkg -i ${PANDOC} \
  && wget ${AUTODOCPATH}/${AUTODOC} \
  && bash -c "source ${CONDA_HOME}/bin/activate h2o && pip install ${AUTODOC}" \
  && rm ${AUTODOC} ${PANDOC}


#######################################################################
## ADD CONTENT FOR INDIVIDUAL HANDS-ON SESSIONS HERE
#######################################################################
#
##COPY --chown=h2o contents/data data
#COPY --chown=h2o contents/h2o-3_hands_on h2o-3_hands_on
#COPY --chown=h2o contents/patrick_hall_mli patrick_hall_mli
#COPY --chown=h2o contents/xai_guidelines xai_guidelines
#
######################################################################

# ----- RUN INFORMATION -----

USER h2o
WORKDIR /home/h2o
ENV JAVA_HOME=/usr

ENTRYPOINT ["/run.sh"]

EXPOSE 54321
EXPOSE 54327
EXPOSE 8888
EXPOSE 8787
EXPOSE 8080

