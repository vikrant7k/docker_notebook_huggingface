FROM dlbase


COPY . /app
WORKDIR /app
RUN pip3 install jupyter
RUN wget http://ai.stanford.edu/~amaas/data/sentiment/aclImdb_v1.tar.gz
RUN tar -xf aclImdb_v1.tar.gz
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]