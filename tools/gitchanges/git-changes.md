# Git Changes

Git Changes 是一个用于筛选当前目录下所有包含改动的 git 仓库，并展示仓库改动信息的 Python 脚本。

## 安装依赖

在使用 Git Changes 之前，请确保已经安装以下依赖：

- Git
- Python 3.x
  同时，也需要安装以下 Python 包：

```bash
pip install tabulate GitPython
```

## 使用方法

在终端中进入要查询的目录，然后运行以下命令即可：

```python
python3 git-changes.py
```

Git Changes 会在终端中显示当前目录下所有包含改动的 Git 仓库的信息，并以表格形式展示各个仓库的改动情况。

## 注意事项

- 如果当前分支名是 detached，则 Git Changes 会创建一个新的分支。
- 如果 Git 的工作目录当前的分支名是 detached，Git Changes 会抛出异常并退出。
- 如果 Git 仓库的状态不是 clean，Git Changes 会提示用户确认是否继续执行脚本。

示例输出

```yaml
=== Changes in /path/to/repo1 ===

Changes not staged for commit:
    modified:   file1.py
    deleted:    file2.py

=== Changes in /path/to/repo2 ===

Untracked files:
    new_file.py

=== Changes in /path/to/repo3 ===

No changes detected.
```

## 联系我们

如果您在使用 Git Changes 过程中遇到问题或者有任何建议，请随时联系我们。
