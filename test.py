from xdg.BaseDirectory import xdg_config_home, xdg_cache_home, xdg_data_dirs, xdg_data_home
import os

DESKTOP_DIRS = list(filter(os.path.exists, [os.path.join(dir, "applications") for dir in xdg_data_dirs]))


dirs = DESKTOP_DIRS

for dir in dirs:
    print(dir)
