# Project

Serves as the base image for the Windows pause image on Kubernetes (https://github.com/kubernetes/kubernetes). 

![image](https://user-images.githubusercontent.com/30281766/145636076-9cd59325-7503-4858-b359-1244bd78eb99.png)

**Diagram**: The change creates an intermediate layer between NanoServer and the Pause Image. 

## Why create an intermediate layer?

An intermediate layer is needed between NanoServer and the pause image to support DCOM scenarios in Kubernetes. The pause image was found to be hijacking the RPC port (port 135) for its entire pod. The Pause Base Image modifies a set of registry keys preventing other containers in the pod from using RPC. The dockerfile containing these modifying instructions can be found in this repo. 
> Additionally, having a dedicated pause base image (built on Windows) will allow for more effective solutions regarding the composition of the pause image.  

### Modified Registry Keys 
#### HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\rpc
- "DCOM Protocols"=hex(7):00,00
- "UuidSequenceNumber"=dword:01bcf674
- "EpMapDisallowedProtocols"="ncacn_ip_tcp"

#### HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ole
- "EnableDCOM"="N"

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
