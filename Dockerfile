FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["FE-IoRT.csproj", "FE-IoRT/"]
RUN dotnet restore "FE-IoRT/FE-IoRT.csproj"

WORKDIR "/src/FE-IoRT"
COPY . .
RUN dotnet build "FE-IoRT.csproj" -c Release -o /app/build 

FROM build AS publish
RUN dotnet publish "FE-IoRT.csproj" -c Release -o /app/publish

FROM nginx:alpine AS final
WORKDIR /usr/share/nginx/html

# We'll copy all the contents from wwwroot in the publish
# folder into nginx/html for nginx to serve. The destination
# should be the same as what you set in the nginx.conf.
COPY --from=publish /app/publish/wwwroot /usr/local/webapp/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf