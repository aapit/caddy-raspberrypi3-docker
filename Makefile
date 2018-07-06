TARGET_CPU_ARCH=armv7l
DOCKER_IMAGE=aapit/alpine-golang-raspberrypi3
GITHUB_URL=github.com/aapit/alpine-golang-raspberrypi3-docker
CURRENT_CPU_ARCH:=$(shell arch)

build:
ifneq (${CURRENT_CPU_ARCH}, ${TARGET_CPU_ARCH})
	@echo "You can only build ${DOCKER_IMAGE} on ${TARGET_CPU_ARCH}."
	@echo "You're using ${CURRENT_CPU_ARCH}, which is not supported due to CPU specific Docker compilation."
	@exit 1
else
	docker build ${GITHUB_URL} -t ${DOCKER_IMAGE}
endif
