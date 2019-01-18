# python+selenium+Chrome+ubuntu docker image

## build image

docker build --no-cache -t python-chrome-ubuntu .

## run image

docker run -it --privileged --user=chrome python-chrome-ubuntu

## run test

python test.py