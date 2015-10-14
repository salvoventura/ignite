import os, sys
sys.path.append('/opt/cisco/ignite')
os.environ['DJANGO_SETTINGS_MODULE'] = 'ignite.apache.override'

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
