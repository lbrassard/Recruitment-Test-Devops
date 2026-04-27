ARG BUILD_FROM=mcr.microsoft.com/mssql/server:2019-latest
FROM ${BUILD_FROM} AS builder

USER root
EXPOSE 1433:1433

# Establish necessary Env vars
ENV SA_PASSWORD="Nectari2026!"
ENV ACCEPT_EULA=Y
 
# Create symlink to allow sqlcmd to be reached by the seeding script
WORKDIR /opt/mssql-tools/bin/
RUN ln -s /opt/mssql-tools18/bin/sqlcmd /opt/mssql-tools/bin/

# Create a config directory
RUN mkdir -p /var/opt/mssql/docker
WORKDIR /var/opt/mssql/docker
COPY . /var/opt/mssql/docker

# Run db initialisation scripts
RUN chmod +x init_db.sh && \
    ./init_db.sh

# Return to base user
USER mssql

# Create final image
FROM ${BUILD_FROM} AS final

# Import only data from builder layer
COPY --chown=mssql --from=builder /var/opt/mssql/data /var/opt/mssql/data
COPY ./entrypoint.sh .

# Establish necessary Env vars
ENV SA_PASSWORD="Nectari2026!"
ENV ACCEPT_EULA=Y

ENTRYPOINT ["./entrypoint.sh"]