#!/bin/sh
packer build cd-demo-base-ubuntu.json
vagrant box add cd-demo-base-ubuntu out/cd-demo-base-ubuntu/cd-demo-base-ubuntu.box