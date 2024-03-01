FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install --force

 # Copy all project files
COPY . ./ 

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]