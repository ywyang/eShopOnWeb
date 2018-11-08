#FROM centos:centos7

#install .NetCore SDK v2.1
#RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
#RUN rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
#RUN yum -y install libicu
#RUN yum -y install dotnet-sdk-2.1
#RUN yum -y install openssh-clients

FROM microsoft/dotnet:2.1-sdk

WORKDIR /app

#build Web Project
COPY *.sln .
COPY . .
WORKDIR /app/src/Web
RUN dotnet restore
RUN dotnet publish -c Release -o /app

WORKDIR /app

#Set Port&ASPNETCORE_ENVIRONMENT
EXPOSE 5106
ENV ASPNETCORE_ENVIRONMENT Development

ENTRYPOINT ["dotnet", "Web.dll"]
