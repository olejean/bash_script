#!/bin/bash
# Ищем файлы с правом SUID
files=$(find . -perm -4000)
# Если файлы найдены, выводим их имена и даты изменения
if [[ -n "$files" ]]; then
for file in $files; do
date=$(date -r "$file")
sha=$(sha1sum "$file")
echo ${file} ${sha} ${date} # Выводим на экран
echo ${file} ${sha} ${date} >> /opt/suids.list  # Выводим результат в файл suids.list
done
fi

