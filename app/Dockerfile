# Menggunakan base image Node.js versi LTS
FROM node:14-alpine

# Menetapkan direktori kerja di dalam container
WORKDIR /app

# Install Python, make, dan alat build yang dibutuhkan oleh node-gyp
RUN apk add --no-cache python3 py3-pip make g++ build-base

# Menyalin file package.json dan yarn.lock untuk instalasi dependensi
COPY package.json yarn.lock ./

# Menginstal dependensi menggunakan Yarn
RUN yarn install --frozen-lockfile

# Menyalin semua file proyek ke dalam container
COPY . .

# Menjalankan build Tailwind CSS terlebih dahulu
RUN yarn tailwind

# Build aplikasi untuk produksi
RUN yarn build

# Menentukan port yang akan digunakan
EXPOSE 3000

# Perintah default saat container dijalankan
CMD ["yarn", "start"]