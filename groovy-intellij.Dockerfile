FROM groovy:jdk21

USER groovy

ARG IDEAU_FILE=ideaIU-2024.3.1.tar.gz
ARG APACHE_IVY_FILE=apache-ivy-2.5.2-bin.tar.gz

RUN mkdir -p ~/jetbrains && mkdir -p ~/.ivy

# Install IntelliJ IDEA
RUN wget -nv https://download.jetbrains.com/idea/$IDEAU_FILE && \
    tar -xzf $IDEAU_FILE -C ~/jetbrains && \
    rm $IDEAU_FILE

# Download apache ivy
RUN wget -nv https://dlcdn.apache.org//ant/ivy/2.5.2/$APACHE_IVY_FILE && \
	tar -xzf $APACHE_IVY_FILE -C ~/.ivy && \
	rm $APACHE_IVY_FILE

# Configure Groovy Credentials
COPY grapeConfig.xml /home/groovy/.groovy/grapeConfig.xml