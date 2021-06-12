FROM python:latest

ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ffmpeg opus-tools bpm-tools
RUN python -m pip install --upgrade pip
RUN python -m pip install wheel Pyrogram TgCrypto
RUN python -m pip install pytgcalls ffmpeg-python psutil
RUN python -m pip install tgintegration youtube-dl youtube_search requests

RUN wget -q https://github.com/xdipesh/KristinaRadioBot/archive/xdipesh.tar.gz && tar xf xdipesh.tar.gz && rm xdipesh.tar.gz

WORKDIR /KristinaRadioBot-xdipesh
CMD python3 main.py
