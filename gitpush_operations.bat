@echo off
chcp 65001 >nul

echo ========================================
echo 当前状态：
git status
echo ========================================

echo 是否继续执行Git操作？(y/n)
set /p choice="请输入您的选择："

if "%choice%"=="y" (
    echo ========================================
    echo 开始执行Git操作...
    echo ========================================

    echo 切换到 main 分支...
    git checkout main
    echo ========================================

    echo 添加所有更改...
    git add .
    echo ========================================

    echo 提交更改...
    git commit -m "备份文章"
    echo ========================================

    echo 切换到 china 分支...
    git checkout china
    echo ========================================

    echo 合并 main 分支的更改...
    git merge main
    echo ========================================

    echo 推送更改到 Gitee main 分支...
    git push gitee main:main
    echo ========================================

    echo 推送更改到 Gitee china 分支...
    git push gitee china:china
    echo ========================================

    echo 推送更改到 GitHub main 分支...
    git push github main:main
    echo ========================================

    echo 推送更改到 GitHub china 分支...
    git push github china:china
    echo ========================================

    echo 所有操作已完成。切换回 main 分支...
    git checkout main
    echo ========================================

    echo 所有操作已完成，当前分支为 main。
) else if "%choice%"=="n" (
    echo ========================================
    echo 您选择了取消操作。
    echo ========================================
) else (
    echo ========================================
    echo 输入无效，请输入 y 或 n。
    echo ========================================
)

pause