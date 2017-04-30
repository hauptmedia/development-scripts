#!/bin/sh

nsqlookupd &
nsqd --broadcast-address=127.0.0.1 --lookupd-tcp-address=127.0.0.1:4160 &
nsqadmin --lookupd-http-address=127.0.0.1:4161 &
