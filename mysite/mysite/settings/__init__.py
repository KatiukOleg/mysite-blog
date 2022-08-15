from .base import *
import os

if os.getenv('ENV') == 'DEV':
    from .dev import *
elif os.getenv('ENV') == 'LOCAL':
    from .local import *