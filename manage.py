#!/usr/bin/env python
import os
import sys

def main():
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'restaurant.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError:
        raise ImportError("Django is required to run this project. Install with: pip install django")
    execute_from_command_line(sys.argv)

if __name__ == '__main__':
    main()
