FROM maven:3.3.9-jdk-7
WORKDIR /usr/src
RUN git clone http://git.eclipse.org/gitroot/orion/org.eclipse.orion.client.git
RUN git clone http://git.eclipse.org/gitroot/orion/org.eclipse.orion.server.git
WORKDIR /usr/src/org.eclipse.orion.server
RUN mvn clean install -P platform-kepler,local-build -Dorion.client.build.skip -DskipTests
WORKDIR /usr/src/org.eclipse.orion.server/releng/org.eclipse.orion.server.repository/target/products/org.eclipse.orion/linux/gtk/x86_64/eclipse/
VOLUME /workspace
EXPOSE 8080

CMD ["orion"]
