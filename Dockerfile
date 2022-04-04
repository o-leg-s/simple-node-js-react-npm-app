FROM node:alpine

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/node

# RUN npm i -S serve

COPY ["package.json", "package-lock.json*", "./"]

# will execute npm install in /home/app because of WORKDIR
# RUN npm install --production

COPY . .

# CMD ["npx", "serve", "-s", "build"]
CMD ["npm", "start"]