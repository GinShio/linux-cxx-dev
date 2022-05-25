#
#   Copyright (C) 2017-2022 CASM Organization <https://casm-lang.org>
#   All rights reserved.
#
#   Developed by: Philipp Paulweber et al.
#                 <https://github.com/casm-lang/casm-lang.container.linux/graphs/contributors>
#
#   This file is part of casm-lang.container.linux.
#
#   casm-lang.container.linux is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   casm-lang.container.linux is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with casm-lang.container.linux. If not, see <http://www.gnu.org/licenses/>.
#

# MIT License
#
# curl-docker Copyright (c) 2020 James Fuller (jim.fuller@webcomposite.com)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Copyright (C) 2022 GinShio

TARGET := ginshio/cxxdev

DOCKER_TAG := bullseye

DOCKER_IMAGE := ${TARGET}:${DOCKER_TAG}

# from curl-docker <https://github.com/curl/curl-docker/blob/master/Makefile>
DOCKER_BUILD_ARGS :=

# from curl-docker <https://github.com/curl/curl-docker/blob/master/Makefile>
DOCKER_BUILD_OPTS := --no-cache --compress

# from curl-docker <https://github.com/curl/curl-docker/blob/master/Makefile>
DOCKER_MULTI_ARCH := linux/amd64,linux/arm64,linux/ppc64le,linux/mips64le,linux/arm/v7

default: build

build:
	@echo "-- docker: build '${DOCKER_IMAGE}'"
	DOCKER_BUILDKIT=1 docker build ${DOCKER_BUILD_OPTS} ${DOCKER_BUILD_ARGS} -t ${DOCKER_IMAGE} .

multibuild:
	@echo "-- docker: multibuild '${DOCKER_IMAGE}'"
	DOCKER_BUILDKIT=1 docker buildx build ${DOCKER_BUILD_OPTS} ${DOCKER_BUILD_ARGS} -t "${DOCKER_IMAGE}" --platform=${DOCKER_MULTI_ARCH} -f Dockerfile . --push
	@docker buildx imagetools inspect ${DOCKER_IMAGE}
	docker buildx imagetools create ${DOCKER_IMAGE} -t "${TARGET}:latest"

run:
	@echo "-- docker: run '${DOCKER_IMAGE}'"
	docker run -it ${DOCKER_IMAGE} bash

deploy:
	@echo "-- docker: push '${DOCKER_IMAGE}'"
	docker push "${DOCKER_IMAGE}" "${TARGET}:latest"
