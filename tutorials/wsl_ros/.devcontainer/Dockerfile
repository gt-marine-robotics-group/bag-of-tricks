FROM osrf/ros:foxy-desktop
ARG USERNAME=vs
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Add rosdep update

RUN echo 'source /opt/ros/foxy/setup.bash' >> /home/$USERNAME/.bashrc
RUN echo 'PROMPT_DIRTRIM=2' >> /home/$USERNAME/.bashrc

USER $USERNAME