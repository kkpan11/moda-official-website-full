# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
 
# copy csproj and restore as distinct layers
COPY WebSite/WebSite.csproj WebSite/
COPY DBModel/DBModel.csproj DBModel/
COPY Services/Services.csproj Services/
COPY Utility/Utility.csproj Utility/
RUN dotnet restore --use-current-runtime WebSite/WebSite.csproj

# copy and publish app and libraries
COPY . .
RUN dotnet publish WebSite/WebSite.csproj -c Release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "WebSite.dll"]