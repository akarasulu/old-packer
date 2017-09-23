#!/bin/bash
#
# Performs some preliminary checks to make sure everything is properly setup.

if [ -z "$DESKTOP" ]; then
  echo DESKTOP is not defined, exiting ...
  exit 1
else
  echo DESKTOP is defined as $DESKTOP
fi

if [ -z "$SSH_USERNAME" ]; then
  echo SSH_USERNAME is not defined, exiting ...
  exit 1
else
  echo SSH_USERNAME is defined as $SSH_USERNAME
fi

if [ -z "$DISTRIBUTION" ]; then
  echo DISTRIBUTION is not defined, exiting ...
  exit 1
else
  echo DISTRIBUTION is defined as $DISTRIBUTION
fi
