# :robot: Blazor Robotics IoT Dashboard

[![Build Status](https://dev.azure.com/amirashrafizham7/IoT%20RaspberryPI/_apis/build/status/Frontend%20-%20IoRT%20Raspberry%20Pi?branchName=master)](https://dev.azure.com/amirashrafizham7/IoT%20RaspberryPI/_build/latest?definitionId=5&branchName=master) 

![Azure DevOps builds](https://img.shields.io/azure-devops/build/amirashrafizham7/3cd2d062-7beb-450b-835a-acb34a7cc906/5)
![Azure DevOps releases](https://vsrm.dev.azure.com/amirashrafizham7/_apis/public/Release/badge/3cd2d062-7beb-450b-835a-acb34a7cc906/5/5)

## :thought_balloon: About
This is a Blazor WebAssembly dashboard project and has the following features :
- The user is able to remotely manoeuvre a robot through a web browser
- The user is able to retrieve and monitor IoT sensor data displayed on the dashboard


![MicrosoftTeams-image (4)](https://user-images.githubusercontent.com/59201954/157059323-35ff4bd5-6491-4976-825f-8644b4d21c55.png)

### Features to be added in future release  

1. **Robot Control Panel module**
   - SignalR and BackgroundService to enable real-time IoT sensor monitoring (Temperature, Humidity, Pressure)
   - Ultrasonic sensor chart to detect collision
   - Robot speed sensor chart to monitor the rover's speed
   - Battery status chart to monitor the leftover battery on the RaspberryPi

2. **Weather Station module**
   - Line chart to monitor sensor trends for T-10 seconds 

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## :hammer_and_wrench: Tech Stack
| Technology          | Remarks                                                                                          |
|---------------------|--------------------------------------------------------------------------------------------------|
| Blazor WebAssembly  |  Front End SPA framework to build the dashboard                                                  |
| RaspberryPi         |  Server to host the Web and to host the Azure DevOps agent for CICD                              |
| Docker              |  Containerization platform to package the front-end codes                                        |
| Azure DevOps        |  Continuous Integration/Continuous Deployment platform                                           |
| Nginx               |  Web server to host Dashboard for client-side serving                                            |
| Pi-Top Robotics Kit |  Hardware to maneuver the robot by Pi-Top - Pi-Top OS is used to integrate with the peripherals  |
| SenseHat            |  Hardware to capture IoT sensor data             


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## :fireworks: Installation
### Hardware 

The following hardware is required prior to installing the software
1. RaspberryPi 4B+ 
2. Pi-Top Robotics Kit
3. SenseHat

### Software

1. Install Docker engine on the RaspberryPi
2. Install .NET 5 / .NET 6 on the RaspberryPi
3. Download the docker image : `amirashrafizham/fe-iort`
4. Run the following docker command : `sudo docker run --privileged -p 5005:80  --name fe-iort --detach --restart unless-stopped amirashrafizham/fe-iort`

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## :computer: Code Structure
### Components
##### **Robot Control Panel - Component to manoeuvre the robot**
![MicrosoftTeams-image (4)](https://user-images.githubusercontent.com/59201954/157059323-35ff4bd5-6491-4976-825f-8644b4d21c55.png)
##### **Weather Station - Component to display weather station**
![MicrosoftTeams-image (6)](https://user-images.githubusercontent.com/59201954/157059610-798afc81-2746-4584-bf6d-29fc323ab601.png)
##### **Accelerometer - Component to display accelerometer**
![MicrosoftTeams-image (5)](https://user-images.githubusercontent.com/59201954/157059453-b815ad71-ef45-4713-af7b-1b13b3cc3085.png)

### Libraries
 
1. Radzen Blazor library

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)
## :rocket:	CICD
These are the steps to build and release the code to the RaspberryPi Server
1. From local machine, push the latest code update to Github
2. Azure Pipelines will automatically trigger the CI pipeline to build and containerize the code with Dockerfile. The Dockerfile has the following main commands
   - `dotnet restore`
   - `dotnet build`
   - `dotnet publish`
   - Copy all files into Nginx runtime
3. Push to Dockerhub for backup
4. Azure Pipelines will then automatically trigger the CD pipeline with the following main commands
   - `docker stop` old image
   - `docker remove` old image
   - `docker run` new image with privileged access, detached mode, restart-unless-stop and point to port 5005
   - `docker remove` images on the server with <None> label

![Screenshot 2022-03-07 232948](https://user-images.githubusercontent.com/59201954/157064781-43e44d84-d6b8-48d5-ae83-64f3ec48f372.png)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## :artificial_satellite: Connectivity

To connect to the dashboard, ensure the client device and the RaspberryPi are within the same wi-fi network. Next point the IP address of the RaspberryPi with port 5005 on the web browser   
![Screenshot 2022-03-10 181115](https://user-images.githubusercontent.com/59201954/157641971-4c602f13-9307-4d59-bbfb-fb91f93c730a.png)

   
   
To connect to the dashboard without any wi-fi network, use an Ethernet cable connection to prevent network latency as the download size of .NET 5 Blazor Wasm is large. To access the dashboard, simply plug the ethernet cable to the client device and point the hostname of the RaspberryPi with port 5005 on the web browser
![Screenshot 2022-03-10 182338](https://user-images.githubusercontent.com/59201954/157642218-4b06e029-31ad-4001-9929-9728aa58bb24.png)


  
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## :film_strip: Demo

<h6>Controlling the rover from a mobile device</h6>
   
![1_0_GIF_1](https://user-images.githubusercontent.com/59201954/158006331-2770bfc3-a9bc-4d32-8133-aac5ad348dfb.GIF)
  
![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

