# Here, we include the dotnet core SDK as the base to build our app
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
# Setting the work directory for our app
WORKDIR /app

# We copy the .csproj of our app to root and 
# restore the dependencies of the project.
COPY . .
RUN dotnet restore "FE-IoRT.csproj"
RUN dotnet publish "FE-IoRT.csproj" -c Release -o /publish

FROM nginx:alpine AS final
WORKDIR /usr/share/nginx/html

# We'll copy all the contents from wwwroot in the publish
# folder into nginx/html for nginx to serve. The destination
# should be the same as what you set in the nginx.conf.
COPY --from=build-env /publish/wwwroot /usr/local/webapp/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf