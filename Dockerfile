# syntax=docker/dockerfile:1.3-labs

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

# Copyright (C) 2022 GinShio


FROM debian:bullseye-slim

# RUN { \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free"; \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free"; \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free"; \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free"; \
#  } |tee /etc/apt/sources.list;

RUN apt update -y && apt upgrade -y; \
    apt install --no-install-recommends -y \
                   bash \
                   bison \
                   build-essential \
                   clang \
                   clang-tidy \
                   cmake \
                   cython3 \
                   doxygen \
                   flex \
                   gdb \
                   make \
                   ninja-build \
                   libboost-all-dev \
                   libevent-dev \
                   libfmt-dev \
                   libjemalloc-dev \
                   libjsoncpp-dev \
                   libopenblas-dev \
                   libopenmpi-dev \
                   libpcre2-dev \
                   librttr-dev \
                   libspdlog-dev \
                   libthrift-dev \
                   libxml2-dev \
                   libzstd-dev \
                   pcre2-utils \
                   valgrind; \
    apt clean && apt autoremove
