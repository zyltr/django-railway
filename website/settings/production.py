from .base import *

# Topical Index
# https://docs.djangoproject.com/en/4.2/ref/settings/#core-settings-topical-index

# Core Settings
# https://docs.djangoproject.com/en/4.2/ref/settings/#core-settings

ALLOWED_HOSTS = env.list("ALLOWED_HOSTS", default=[".up.railway.app"])

# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#database

DATABASE = env.db("DATABASE_URL")

DATABASES = {
    "default": DATABASE,
}

# Debugging
# https://docs.djangoproject.com/en/4.2/ref/settings/#debugging

DEBUG = False

# HTTP
# https://docs.djangoproject.com/en/4.2/ref/settings/#http

SECURE_HSTS_INCLUDE_SUBDOMAINS = env.bool(
    "SECURE_HSTS_INCLUDE_SUBDOMAINS", default=True
)

SECURE_HSTS_SECONDS = env.int("SECURE_HSTS_SECONDS", default=3600)

# Security
# https://docs.djangoproject.com/en/4.2/ref/settings/#security

CSRF_COOKIE_SECURE = env.bool("CSRF_COOKIE_SECURE", default=True)
SECRET_KEY = env.str("SECRET_KEY")

# Sessions
# https://docs.djangoproject.com/en/4.2/ref/settings/#sessions

SESSION_COOKIE_SECURE = env.bool("SESSION_COOKIE_SECURE", default=True)
