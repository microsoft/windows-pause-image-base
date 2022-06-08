ARG OSVERSION
# Notice this image has license terms/requirements – see https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula
FROM mcr.microsoft.com/windows/nanoserver:${OSVERSION}-amd64
COPY binaries /tools
USER ContainerAdministrator
RUN reg import tools\keylight.reg
# Delete DiagTrack service as it causes CPU spikes and delays pod/container startup times.
RUN sc.exe delete diagtrack -f
USER ContainerUser
