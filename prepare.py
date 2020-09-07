"""
Маленькая утилита, которая поможет подготовить код
к отправке на anytask! Удаляет все папки, указанные
в списке deprecated. А еще умеет прибираться в подпапках
"""
import sys
import os
import shutil


def clear():
    path = sys.argv[1]

    deprecated = [".idea", ".pytest_cache", "venv", "__pycache__", ".coverage"]

    os.chdir(path)
    for root, dirs, files in os.walk(".", topdown=False):
        for name in dirs:
            if name in deprecated:
                shutil.rmtree(os.path.join(root, name), ignore_errors=True)
        for name in files:
            if name in deprecated:
                os.remove(name)


if __name__ == "__main__":
    if len(sys.argv) != 1:
        clear()
