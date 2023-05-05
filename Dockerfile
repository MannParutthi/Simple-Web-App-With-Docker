## NOTE: If any changes are made to a particular step, all the steps below that step will be re-run while building the image again
##       So, order of steps is important to optimize the build process

# Use an existing docker image as a base (Specify a base image)
FROM node:14-alpine

# If we copy all files to the root directory then the container's lib folder (config) can be overridden by the project's lib folder and conatiner will not work properly / get corrupted
# To avoid accidently overwriting files in the container, we set the container's working directory to /usr/app (if directory doesn't exist, it will be created)
WORKDIR /usr/app

# Allowing package.json to be copied to the container so that the npm install command can be run
# COPY {source - path inside our local machine (relative to build context)} {destination - path inside the container}
COPY ./package.json ./

# Download and install dependencies (Run some commands to install additional programs)
RUN npm install

# COPY the rest of the files => To avoid re-running npm install every time we make a change to the project (and use the cache for previous steps)
COPY ./ ./

# Tell the image what to do when it starts as a container (Specify a command to run on container startup)
CMD ["npm", "start"]