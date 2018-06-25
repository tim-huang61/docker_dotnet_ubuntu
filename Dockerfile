# 基底
FROM ubuntu

# install library
RUN apt-get update
RUN apt-get install -y wget gpg

# https://www.microsoft.com/net/download/linux-package-manager/ubuntu18-04/sdk-current

# install microsoft.gpg
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list 
RUN mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN chown root:root /etc/apt/sources.list.d/microsoft-prod.list

#Install .Net Core SDK
RUN apt-get update
RUN apt-get install -y apt-transport-https
RUN apt-get install -y dotnet-sdk-2.1

CMD ["cat", "Ubuntu with .Net Core 2.1"]
