FROM python:3.7.3-alpine
ENV SRM_DOMAIN_NAME='http://srm:8000' GPS='k5YOrdPzD' SRM='e4hKUhhMh' \
    SENDGRID_API_KEY='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' SERVER_REQUST_METHOD_HTTP='http://'\
    SERVER_ALLOWED_HOSTS='*' SERVER_DEBUG='True' \
    DB_HOST='db_gps' DB_USERNAME='root' DB_PASS='password' DB_NAME='gps_backend' \
    AWS_DEFAULT_REGION='us-east-1' \
    AWS_ACCESS_KEY_ID="AKIAIZZPF5XTKUH4FN3Q" AWS_SECRET_ACCESS_KEY="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" \
    AWS_STORAGE_BUCKET_NAME="stargate-student" \
    S3_BASE_URL="https://stargate-cdn.startmypathway.com/" \
    AWS_COGNITO_USER_POOL_ID='us-east-1_fvhg6i4OV' AWS_COGNITO_CLIENT_ID='3qlj82sn3drkqlcs1r2anq6bk5' \
    AWS_COGNITO_CLIENT_SECRET='10cfae2a92n4h4qfgldiscg1k6eorhc5t0acrftp0guebmgsgv79' \
    USER_EMAIL="DONOTRESPOND@stargatesrm.com" TWILIO_ACCOUNT_SID="123" TWILIO_AUTH_TOKEN="!23" \
    TWILIO_PHONE_NUMBER="123" ROOT_PAGE_NAME="123"\
    ORIGIN="http://localhost:3000" \
    EMAIL_HOST='smtp.sendgrid.net'\
    EMAIL_HOST_USER='ashishrkarn'\
    EMAIL_HOST_PASSWORD='ashish12345'\
    CACHE_SERVER="cache_gps"\
    SERVER_ENV="dev"

RUN apk add --no-cache curl make gcc libc-dev linux-headers musl-dev tk-dev tcl-dev openssl-dev libffi-dev mysql-client mariadb-dev python3-dev jpeg-dev zlib-dev freetype-dev lcms2-dev tiff-dev openjpeg-dev
RUN mkdir /app
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -U setuptools
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app

CMD python3 /app/manage.py runserver 0.0.0.0:8000
# CMD ["python3", "/app/manage.py", "runserver", "0.0.0.0:8000"]