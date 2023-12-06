FROM mcr.microsoft.com/dotnet/sdk:6.0
COPY . .

# Dotnet build permission denied in Docker container running Jenkins
# https://stackoverflow.com/questions/53556623/dotnet-build-permission-denied-in-docker-container-running-jenkins
# Interacting with NuGet fails on .NET 6.0.10 when running in docker with user
# https://github.com/dotnet/core/issues/7868
# Set the Environment Variable for the DOTNET CLI HOME PATH
# Set the Environment Variable XDG_DATA_HOME
ARG dotnet_cli_home_arg=/tmp/
ARG xdg_data_home_arg=/tmp
ENV DOTNET_CLI_HOME=$dotnet_cli_home_arg
ENV XDG_DATA_HOME=$xdg_data_home_arg