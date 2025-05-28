#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user

yum install -y automake fuse fuse-devel gcc-c++ git libcurl-devel libxml2-devel make openssl-devel
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make
make install

echo "your-access-key:your-secret-key" > /etc/passwd-s3fs
chmod 600 /etc/passwd-s3fs

mkdir /mnt/s3bucket
s3fs my-shared-storage-bucket-xyz /mnt/s3bucket -o passwd_file=/etc/passwd-s3fs
