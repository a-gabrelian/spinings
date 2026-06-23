@echo off
chcp 65001 >nul
REM Ссылка на GitHub репозиторий
set REPO_URL=https://github.com/a-gabrelian/spinings.git

REM --- Проверка, установлен ли Git и виден ли он в PATH ---
where git >nul 2>nul
if errorlevel 1 (
    echo ОШИБКА: Git не найден в системе.
    echo Установите его с https://git-scm.com/downloads
    echo и при установке отметьте пункт "Add Git to PATH".
    echo.
    pause
    exit /b
)

echo Git найден, продолжаем...
echo.

REM --- Инициализация (порядок исправлен: init ДО remote remove) ---
git init
git remote remove origin

git remote add origin %REPO_URL%
git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main

if errorlevel 1 (
    echo.
    echo ====================================================
    echo ОШИБКА: не удалось отправить изменения на GitHub.
    echo Прочитайте сообщение об ошибке выше - там обычно
    echo указана причина (неверный URL, нет прав доступа,
    echo репозиторий не пустой и т.п.)
    echo ====================================================
) else (
    echo.
    echo ====================================================
    echo Готово! Изменения успешно отправлены в репозиторий.
    echo ====================================================
)

echo.
pause