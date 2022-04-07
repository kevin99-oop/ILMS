
#!/usr/bin/env bash

cd_to_install () {
  cd /home/ec2-user/install
}

cd_to () {
  cd /home/ec2-user/install/$1
}

if ! [ -x "$(command -v tesseract)" ]; then
  # Add `usr/local/bin` to PATH
  echo 'pathmunge /usr/local/bin' > /etc/profile.d/usr_local.sh
  chmod +x /etc/profile.d/usr_local.sh

  # Install leptonica
  cd_to_install
  wget http://www.leptonica.org/source/leptonica-1.73.tar.gz
  tar -zxvf leptonica-1.73.tar.gz
  cd_to leptonica-1.73
  ./configure
  make
  make install
  rm -rf /home/ec2-user/install/leptonica-1.73.tar.gz
  rm -rf /home/ec2-user/install/leptonica-1.73

  # Install tesseract ~ the jewel of Odin's treasure room
  cd_to_install
  wget https://github.com/tesseract-ocr/tesseract/archive/3.04.01.tar.gz
  tar -zxvf 3.04.01.tar.gz
  cd_to tesseract-3.04.01
  ./autogen.sh
  ./configure
  make
  make install
  ldconfig
  rm -rf /home/ec2-user/install/3.04.01.tar.gz
  rm -rf /home/ec2-user/install/tesseract-3.04.01

  # Install tessdata
  cd_to_install
  wget https://github.com/tesseract-ocr/tessdata/archive/3.04.00.tar.gz
  tar -zxvf 3.04.00.tar.gz
  cp /home/ec2-user/install/tessdata-3.04.00/eng.* /usr/local/share/tessdata/
  rm -rf /home/ec2-user/install/3.04.00.tar.gz
  rm -rf /home/ec2-user/install/tessdata-3.04.00
fi
