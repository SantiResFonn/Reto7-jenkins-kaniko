
mkdir -p /kaniko/.dockerconfig
ln -s /kaniko/.docker/.dockerconfigjson /kaniko/.dockerconfig/config.json

IMAGE_ID=$1
IMAGE_TAG=$2

export DOCKER_CONFIG=/kaniko/.dockerconfig

/kaniko/executor \
  --context="/home/jenkins/agent/workspace/kaniko/docker-images/jenkins-controller" \
  --dockerfile="/home/jenkins/agent/workspace/kaniko/docker-images/jenkins-controller/Dockerfile" \
  --destination=$IMAGE_ID:$IMAGE_TAG \
  --force