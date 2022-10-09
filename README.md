# Prepare host

```bash
sudo snap install docker
```

# Build
```bash
sudo docker build -t thedeveloper/nvim .
sudo docker run -it nvim:latest /bin/bash
# run nvim setup
nvim
docker ps -a
sudo docker commit <container-id> thedeveloper/nvim
docker push thedeveloper/nvim
```

# Use
```bash
source nvim
nvim <path>
```