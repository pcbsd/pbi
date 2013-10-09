#!/bin/sh

#fetch the minecraft.jar(s) from the main website
cd ${PBI_PROGDIRPATH}

fetch https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar
fetch https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar

