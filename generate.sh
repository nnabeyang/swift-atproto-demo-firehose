#!/bin/bash
swift package plugin --allow-writing-to-package-directory \
--allow-network-connections all:443 swift-atproto
