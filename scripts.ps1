docker build -t blog-marcos-app:latest .

#detached mode". 
# Quando você usa essa opção, o container é executado em segundo plano (background) e o 
# terminal não fica "preso" ao processo do container. Ele retorna apenas o ID do container iniciado.


docker run -d -p 80:80 blog-marcos-app:latest

az login az l

# Create a resource group
az group create --name containerappslab03 --location eastus

# Create Container Registry
az acr create --resource-group containerappslab03 --name blogmarcosacr --sku Basic

# Login to ACR
az acr login --name blogmarcosacr

# Tag the image
docker tag blog-marcos-app:latest blogmarcosacr.azurecr.io/blog-marcos-app:latest

# Push the image
docker push blogmarcosacr.azurecr.io/blog-marcos-app:latest

#containerID = blogmarcosacr.azurecr.io/blog-marcos-app:latest
#user =  blogmarcosacr
#password = duzYmeARNVgFRMrndpcI91oXkqOJfC4YjrZYUDyAxQ+ACRCFxFzB

# Create Environment container app
az containerapp env create  --name blog-marcos-env --resource-group containerappslab03 --location eastus 

# Create Container App
az containerapp create --name blog-marcos-app --resource-group containerappslab03 --image blogmarcosacr.azurecr.io/blog-marcos-app:latest --environment blog-marcos-env --target-port 80 --ingress external --registry-username blogmarcosacr --registry-password duzYmeARNVgFRMrndpcI91oXkqOJfC4YjrZYUDyAxQ+ACRCFxFzB --registry-server blogmarcosacr.azurecr.io


# az containerapp create \
# --name blog-marcos-app \
# --resource-group containerappslab03 \
# --location eastus \
# --image blogmarcosacr.azurecr.io/blog-marcos-app:latest \
# --environment blog-marcos-env \
# --target-port 80 \ 
# --ingress external
# --registry-username blogmarcosacr
# --registry-password duzYmeARNVgFRMrndpcI91oXkqOJfC4YjrZYUDyAxQ+ACRCFxFzB
# --registry-server blogmarcosacr.azurecr.io



