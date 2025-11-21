FROM ros:jazzy

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update && apt-get install -y --no-install-recommends \
    ros-jazzy-pcl-ros=2.6.2* \
    libpcl-dev=1.14.0* \
    libomp-dev=1:18.0* \
    libeigen3-dev=3.4.0* \
    libapr1-dev=1.7.2* \
    libaprutil1-dev=1.6.3* \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/workspace/src/
COPY . dlio

WORKDIR /root/workspace/
RUN /bin/bash -c "source /opt/ros/jazzy/setup.bash && colcon build"
