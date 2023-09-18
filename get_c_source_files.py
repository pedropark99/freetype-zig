import pathlib
import re
src_path = pathlib.Path("src")
c_glob = src_path.rglob("*.c")
all_c_source_files = [f'"{str(path)}"' for path in list(c_glob)]
all_c_source_files = ',\n'.join(all_c_source_files)


backslash = re.compile(r'\\')
all_c_source_files = re.sub(backslash, '/', all_c_source_files)
print(all_c_source_files)