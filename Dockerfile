FROM python:3.8-alpine

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

RUN apk --no-cache add ffmpeg

WORKDIR /code

COPY . /code

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "/code/bot/bot.py"]
