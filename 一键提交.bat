@echo off
chcp 65001 >nul
git status

echo 是否继续执行Git操作？(y/n)
set /p choice="请输入您的选择："

if "%choice%"=="y" (
    echo 开始执行Git操作...
    git checkout main
    git add .
    git commit -m "备份文章"
    git checkout china
    git merge main
    git push gitee main:main
    git push gitee china:china
    git push github main:main
    git push github china:china
) else if "%choice%"=="n" (
    echo 您选择了取消操作。
) else (
    echo 输入无效，请输入 y 或 n。
)

pause