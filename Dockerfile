FROM mcr.microsoft.com/dotnet/sdk:6.0
COPY . .

# Dotnet build permission denied in Docker container running Jenkins
# https://stackoverflow.com/questions/53556623/dotnet-build-permission-denied-in-docker-container-running-jenkins
# Set the Environment Variable for the DOTNET CLI HOME PATH
ARG dotnet_cli_home_arg=/tmp/
ENV DOTNET_CLI_HOME=$dotnet_cli_home_arg