# pufferpanel-adm

__PufferPanel version__: _`2.7.1`_
__ADM package version__: _`2.7.1.r01-BETA`_

![GitHub license](https://img.shields.io/badge/license-GPL--3.0-%23fe7d37) ![GitHub last commit](https://img.shields.io/github/last-commit/EndMove/pufferpanel-adm)

[![Donate][link-icon-coffee]][link-paypal-me] [![Website][link-icon-website]][link-website]

[link-icon-coffee]: https://img.shields.io/badge/%E2%98%95-Buy%20me%20a%20cup%20of%20coffee-991481.svg
[link-paypal-me]: https://www.paypal.me/EndMove/2.5eur
[link-icon-website]: https://img.shields.io/badge/%F0%9F%92%BB-My%20Web%20Site-0078D4.svg
[link-website]: https://www.endmove.eu/

pufferpanel-adm is an application for ADM the operating system of [ASUSTOR](https://www.asustor.com/) the server brand of [ASUS](https://www.asus.com/).
This application uses the docker package available [here](https://github.com/PufferPanel/PufferPanel).

## Requirements

- application docker-ce (>=20.10.2.r2) ;
- server with an x86-64 or arm64 architecture ;
- ADM (>=3.5.0) ;

## Installation

Download the `.apk` file available in the release versions
of this repository.

Go to `APP Central >> Manage >> Manual Installation`.

Select the application `.apk` and follow the installation process.

__:warning: This application is not an Android application !__

## Configuration folder

This application will create a folder in `/volume1/Docker/PufferPanel`, this folder will contain all game server, and the embedded database.

## Configuration

The configuration is automatic, the data storage is persisted on an embedded SQLite3 database.
You can reach the panel by visiting http://your-server-ip:8080/ the default user and password are `admin@admin.com` and `admin2000`.

## How to update PufferPanel for ADM ?

When an update is available you can do it directly from APP CENTRAL in ADM. If you want to do it manually, nothing could be easier. Install directly the new version without uninstalling first and all your data will be kept, in some cases for major release it is possible that I indicate an additional procedure to follow.

## An issue or a request ?

You can report a problem, ask for help or make changes at any time by following this [link](https://github.com/EndMove/pufferpanel-adm/issues/new). Remember that I am not the developer of PufferPanel but of PufferPanel-ADM.