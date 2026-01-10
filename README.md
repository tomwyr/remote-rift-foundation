# Remote Rift Foundation

Shared packages for **Remote Rift**, an application that lets you queue for League of Legends games from your phone.

## Overview

Remote Rift Foundation contains shared code to ensure reusability of common components and patterns across Remote Rift projects.

## Architecture

The project is built in Dart, enabling reuse across other Remote Rift tools and applications.

### Code structure

The project consists of the following packages:

- **ui** - Provides shared UI components such as widgets and themes for consistent application design, along with other Flutter specific utilities.

- **utils** - Contains general-purpose Dart utilities without dependency on the Flutter framework.

### Service discovery

The project uses mDNS to enable automatic service discovery and registration on the local network. When the connector service starts, it advertises itself using the `_remoterift._tcp` service type, allowing Remote Rift mobile and desktop clients to detect and connect to the service without manual configuration.

This is achieved through the [Bonsoir](https://pub.dev/packages/bonsoir) package, which handles broadcasting the service and discovering available instances on the network. For more information on how service discovery and registration work, see the [ServiceRegistry](./packages/api/lib/src/api/registry.dart) class.

### Dependencies

This section describes selected third-party packages used throughout the project:

- [bonsoir](https://pub.dev/packages/bonsoir) - mDNS/DNS-SD service discovery for advertising and discovering services on the local network.

## Related Projects

- [Remote Rift Website](https://github.com/tomwyr/remote-rift-website) - A landing page showcasing the application and guiding users on getting started.
- [Remote Rift Connector](https://github.com/tomwyr/remote-rift-connector) - A local service that connects to and communicates with the League Client API.
- [Remote Rift Desktop](https://github.com/tomwyr/remote-rift-desktop) - A desktop application that launches and manages the local connector service.
- [Remote Rift Mobile](https://github.com/tomwyr/remote-rift-mobile) - A mobile application that allows remote interaction with the League client.
