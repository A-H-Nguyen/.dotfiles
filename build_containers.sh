#!/bin/bash

# Too many skill issues, just hard code a docker build command for now
# TODO - Make this recursive!
#		 ... although I'm not sure how worth it that would be as I have no idea
#			 how many more personal Dockerfiles I'll be making in the future
docker build -t my-images/arch -f $HOME/.dotfiles/.dockerfiles/Dockerfile.arch $HOME

docker image prune -f

