#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["ModaMailBox/ModaMailBox.csproj", "ModaMailBox/"]
COPY ["DBModel/DBModel.csproj", "DBModel/"]
COPY ["Services/Services.csproj", "Services/"]
COPY ["Utility/Utility.csproj", "Utility/"]
RUN dotnet restore "ModaMailBox/ModaMailBox.csproj"
COPY . .
WORKDIR "/src/ModaMailBox"
RUN dotnet build "ModaMailBox.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ModaMailBox.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ModaMailBox.dll"]