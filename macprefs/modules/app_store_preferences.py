from os import listdir, path
import logging as log
from macprefs.config import (
    get_app_store_preferences_backup_dir,
    get_app_store_preferences_dir,
    ensure_exists,
)
from macprefs.utils import copy_file, copy_files, execute_shell


def backup():
    log.info("Backing up app store preferences (.plist)...")
    files = build_file_list()
    dest = get_app_store_preferences_backup_dir()
    copy_files(files, dest)


def restore():
    log.info("Restoring app store preferences (.plist)...")
    source = get_app_store_preferences_backup_dir()
    dest = get_app_store_preferences_dir()
    for f in listdir(source):
        domain = f.split(".plist")[0]
        dest_path = path.join(dest, domain, "Data/Library/Preferences")
        ensure_exists(dest_path)
        source_file = path.join(source, f)
        copy_file(source_file, dest_path)


def build_file_list():
    source = get_app_store_preferences_dir()
    command = (
        "find "
        + source
        + '*/Data/Library/Preferences -type f -name "*.plist" 2>/dev/null'
    )
    result = execute_shell(command, is_shell=True, suppress_errors=True)
    files = result.strip().split("\n")
    return files
