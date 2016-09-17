1 自述
-------
这是吴皎的emacs配置文件，其中包含了各个大神有效的无效的配置。
无效的配置已经注释掉了。
主要提供的功能是 加强版cscope + autocomplete

2 需要做些什么，让你的emacs跑起来
--------------------------------------
a   安装一些软件
    # 想办法安装emacs23，ubuntu12.04 和ubuntu14.04
    sudo apt-get install emacs23  # 务必将其他版本的emacs卸载掉
    sudo apt-get install cscope   # 安装cscope的支持
    sudo apt-get install cflow
b   做些拷贝/链接动作，这里采用软链接
    sudo rm /usr/bin/cscope-indexer
    sudo ln -s ${PWD}/.emacs.d/lisp/grep_cscope_file /usr/bin/grep_cscope_file
    sudo ln -s ${PWD}/.emacs.d/lisp/cscope-indexer /usr/bin/cscope-indexer
    ln -s ${PWD}/.emacs.d/lisp/.emacs ~/.emacs
    ln -s ${PWD}/.emacs.d ~/.emacs.d

c   打开你的emacs试试
    emacs &

d   如果有问题的话，反馈给我
    wujiaososo@qq.com # 此邮箱会很快回复

3 emacs 的简单介绍
------------------
emacs 是“我是gnu我最牛”的创始人xxx编写，现在由gnu维护的一款编辑器，年头有点儿久了。
emacs 的快捷键很多，并且支持自定义。
emacs 没有什么牛逼的，不过看c代码比较爽，其他的什么高阶功能，lisp 和 org mode很吊。
emacs 有些小功能，我比较喜欢
   hexl-mode ：用来打开bin文件并且快速查看bin文件的内容
   cua-mode：列编辑功能，我尝尝和hexl-mode组合起来用，把bin文件搞成一个数组
   ediff-buffers：对比两个打开的文件，在没有meld的时候还是可以用一下
   vc-diff：查看当前的文件相对于版本库的改动，挺好的，快速看到你改了什么，还能马上定位过去
   grep：就是在emacs里面执行grep命令，参数就是grep命令的参数，方便的是可以马上定位到grep出来的内容那里去
   查找替换：可以替换一段文字

emacs 也有不好的
   看java代码还是eclipse 或者其他的
   输入中文的问题，有的机器可以，有的不行，我也是醉了，不care了，忍了
   补全这个问题，semantic 太慢， autocomplete对结构体补全几乎没啥支持，本来有个clang我还没有摆平
   ctrl+c ctrl+v ctrl+x 我也已经习惯了 alt-w ctr+y ctrl+w

4 cscope 的简单介绍
-------------------
cscope 就是用来索引c 代码的，速度还可以接受。
所有的函数/变量/文件/符号/字符串的查找结果都可以直接跳转过去，并且可以很方便的进行二次查找
最强的的功能莫过于 符号/字符串查找功能。
经过我加强以后，可以索引如下后缀名结尾的文件
"h", "H", "c", "C", "cc", "CC", "Cpp", "cpp", "CPP", "s", "S", "txt", "lds", "ld",  "mk",
另外文件名是如下的文件也会被索引到
"Makefile", "Kconfig", "README", "Kbuild"

5 autocomplete 的简单介绍
-------------------------
autocomplete很强大，可以支持各种补全字典
比如当前的buffer的所有单词，所有打开的buffer的所有单词，所有相同模式下打开的buffer的所有单词，，，
以及YASnippet，另外clang的补全也可以支持（ps：我没有弄好）


附录：

C- ： ctrl- # ctrl的简写 
M- ： alt-  # alt的简写
Ret ： enter 键
cscope 的快捷键
----------------
建立索引：             M-x cscope-index-files Ret 目录名
查找字符串：           C-c s t
查找符号：             C-c s s
查找符号定义：         C-c s g
查找调用函数的函数：    C-c s c
查找被函数调用的函数：  C-c s C
查找文件：             C-c s c f
查找包含文件的文件：    C-c s c i
返回：                 C-c s u 














