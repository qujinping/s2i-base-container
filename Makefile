SKIP_SQUASH?=0

ifeq ($(TARGET),rhel7)
	OS := rhel7
else
	OS := centos7
endif

NAMESPACE = "core/"
BASE_IMAGE_NAME = "builder-base"

script_env = \
	SKIP_SQUASH=$(SKIP_SQUASH)                      \
	VERSIONS="$(VERSIONS)"                          \
	OS=$(OS)                                        \
	VERSION=$(VERSION)                              \
	NAMESPACE=$(NAMESPACE)              \
	BASE_IMAGE_NAME=$(BASE_IMAGE_NAME)              \
	OPENSHIFT_NAMESPACES="$(OPENSHIFT_NAMESPACES)"


.PHONY: build
build:
	$(script_env) hack/build.sh 

.PHONY: test
test:
	$(script_env) TAG_ON_SUCCESS=$(TAG_ON_SUCCESS) TEST_MODE=true hack/build.sh
