## SVN 配置

- `cp script/svndiff_nvim.sh ${XDG_DATA_HOME:-$HOME/.local}"/bin/svndiff_nvim.sh`
- 在/etc/subversion/config 或者~/.svnconfig/config 中查找`diff-cmd`，并参考如下配置进行修改。
  ```config
  editor-cmd = nvim
  ### Set diff-cmd to the absolute path of your 'diff' program.
  ###   This will override the compile-time default, which is to use
  ###   Subversion's internal diff implementation.
  diff-cmd = ${XDG_DATA_HOME:-$HOME/.local}"/bin/svndiff_nvim.sh
  ```
