ARG OSVERSION
# Notice this image has license terms/requirements – see https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula
FROM mcr.microsoft.com/windows/nanoserver:${OSVERSION}-amd64
COPY binaries /tools
USER ContainerAdministrator
RUN reg import tools\keylight.reg
USER ContainerUser
