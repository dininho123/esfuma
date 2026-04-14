FROM tomcat:10.1-jdk21-temurin

# Remove as aplicações padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia o site para a raiz do Tomcat (acessível em / sem /ESFUMA/)
COPY . /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh", "run"]
