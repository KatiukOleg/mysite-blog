from .base import *

ALLOWED_HOSTS = ['127.0.0.1']
DEBUG = True
STATIC_URL = 'static/'
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, '../blog/static'),
]