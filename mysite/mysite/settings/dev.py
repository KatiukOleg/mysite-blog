from .base import *
#import boto3

ALLOWED_HOSTS = ['127.0.0.1']
DEBUG = False

session = boto3.Session(aws_access_key_id=os.getenv('AWS_ACCESS_KEY_ID'), aws_secret_access_key=os.getenv('AWS_SECRET_ACCESS_KEY'), region_name="eu-north-1")
ssm = session.client('ssm')

# Values for static storage in AWS
BUCKET_OBJECT = ssm.get_parameter(Name='mysite-blog-dev1-static-bucket')
BUCKET_VALUE = BUCKET_OBJECT['Parameter']['Value']
#print(BUCKET_VALUE)
#print(BUCKET_OBJECT['Parameter']['Value'])

SECRET_KEY_OBJECT = ssm.get_parameter(Name='mysite-blog-dev1-secret-key')
SECRET_KEY = SECRET_KEY_OBJECT['Parameter']['Value']

# Variables for django-storages - https://django-storages.readthedocs.io/en/latest/backends/amazon-S3.html
AWS_ACCESS_KEY_ID = os.getenv('AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = os.getenv('AWS_SECRET_ACCESS_KEY')
AWS_STORAGE_BUCKET_NAME = BUCKET_VALUE
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME
AWS_S3_OBJECT_PARAMETERS = {
    'CacheControl': 'max-age=86400',
}
AWS_LOCATION = 'static'
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, '../blog/static'),
]
STATIC_URL = 'https://%s/%s/' % (AWS_S3_CUSTOM_DOMAIN, AWS_LOCATION)
STATICFILES_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'