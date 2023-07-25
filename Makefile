BASE_TAG = base-open5gs
MONGO_TAG = open5gs-mongo
DEPLOYMENT_TAG = amarisoft

PREFIX = registry.gitlab.bsc.es/ppc/software/open5gs/

# Set default architecture to amd
ARCH_TAG=latest
# Check if the system architecture is arm
# ifeq ($(shell uname -m),aarch64)
#     ARCH_TAG=arm
# endif

all: baseopen

baseopen: 
	docker build -f base/Dockerfile -t $(PREFIX)$(BASE_TAG)-$(DEPLOYMENT_TAG):$(ARCH_TAG) .
	docker push $(PREFIX)$(BASE_TAG)-$(DEPLOYMENT_TAG):$(ARCH_TAG)

# openmongo: baseopen
# 	docker build --progress=plain -f mongo/Dockerfile -t $(PREFIX)$(MONGO_TAG):$(ARCH_TAG) . 
# 	docker push $(PREFIX)$(MONGO_TAG):$(ARCH_TAG)