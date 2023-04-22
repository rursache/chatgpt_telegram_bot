FROM python:3.8-alpine

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

RUN apk --no-cache add ffmpeg

RUN mkdir -p /code/bot /code/config
ADD . /code
WORKDIR /code

RUN pip3 install --no-cache-dir -r requirements.txt

VOLUME /code/bot
VOLUME /code/config

CMD ["python3", "/code/bot/bot.py"]
