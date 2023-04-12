DOTNET_TAG=net6.0
MAVEN_TAG=mvn3.8.8
NODE_TAG=node16
PYTHON_TAG=python3.9
ALL_IN_ONE_TAG=${MAVEN_TAG}-${DOTNET_TAG}-${NODE_TAG}-${PYTHON_TAG}

all: all-in-one dotnet maven node python

all-in-one:
	docker buildx build -f Dockerfile.allinone --tag pmpplatform/gocd-agent-allinone:${ALL_IN_ONE_TAG} -o type=image --push --platform=linux/amd64 .

dotnet:
	docker buildx build -f Dockerfile.dotnet --tag pmpplatform/gocd-agent-dotnet:${DOTNET_TAG} -o type=image --push --platform=linux/amd64 .

maven:
	docker buildx build -f Dockerfile.maven --tag pmpplatform/gocd-agent-maven:${MAVEN_TAG} -o type=image --push --platform=linux/amd64 .

node:
	docker buildx build -f Dockerfile.node --tag pmpplatform/gocd-agent-node:${NODE_TAG} -o type=image --push --platform=linux/amd64 .

python:
	docker buildx build -f Dockerfile.python --tag pmpplatform/gocd-agent-python:${PYTHON_TAG} -o type=image --push --platform=linux/amd64 .
