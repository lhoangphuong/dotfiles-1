python3 $HOME/awscli-snippets/getcredentials-horizon.py
docker run -p 8081:8080 -e CONFIG_SERVER_URL="https://int5config-server.euwe.tyxr.net" -e ENV_NAME="int5" 692650986882.dkr.ecr.eu-west-1.amazonaws.com/tyxr/backend-services:int5
