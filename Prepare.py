import sys
import os
import shutil


if __name__ == "__main__":
    if len(sys.argv) == 1:
        exit(1)

    path = sys.argv[1]

    deprecated = [".idea", ".pytest_cache", "venv", "__pycache__"]

    os.chdir(path)
    for root, dirs, files in os.walk(".", topdown=False):
        for name in dirs:
            if name in deprecated:
                shutil.rmtree(os.path.join(root, name), ignore_errors=True)
