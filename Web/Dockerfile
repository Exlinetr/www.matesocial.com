FROM microsoft/aspnetcore:1.1
ARG source
WORKDIR /app
COPY ${source:-./html} .
EXPOSE 80
ENTRYPOINT ["dotnet", "Matesocail.dll"]

