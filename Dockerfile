ARG OSVERSION
FROM mcr.microsoft.com/windows/nanoserver:${OSVERSION}-amd64
COPY binaries /tools
USER ContainerAdministrator
RUN reg import tools\keylight.reg
USER ContainerUser
