% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% !Mode:: "TeX:UTF-8"

\documentclass{resume}
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\usepackage{xcolor}

\makeatletter
% renewcommand for coverletter use
\newcommand{\mytitle}[1]{\def\@mytitle{#1}}
\renewcommand{\name}[1]{
  \def\@name{#1}
  \centerline{\Huge\scshape{#1} \ifdefined\@mytitle{~\textbar~\huge\textnormal{\@mytitle}}\fi}
  \vspace{1.25ex}
}
%\renewcommand{\email}[1]{
%	\def\@email{#1}
%	\faEnvelope\ \href{mailto:#1}{#1}
%}
%\renewcommand{\phone}[1]{
%	\def\@phone{#1}
%	\faPhone\ {#1}
%}
\makeatother

$if(listings)$
\usepackage{listings}
\newcommand{\passthrough}[1]{#1}
\lstset{defaultdialect=[5.3]Lua}
\lstset{defaultdialect=[x86masm]Assembler}
$endif$

$if(CJKmainfont)$
\usepackage{xeCJK}
\setCJKmainfont[$for(CJKoptions)$$CJKoptions$$sep$,$endfor$]{$CJKmainfont$}
$endif$

$for(header-includes)$
$header-includes$
$endfor$

\begin{document}
\pagenumbering{gobble} % suppress displaying page number

% \name中要用到title，要放前面
$if(title)$
\mytitle{$title$}
$endif$

$if(name)$
\name{$name$}
\myname{$name$}
$else$
\name{姓名}
\myname{姓名}
$endif$

\basicInfo{
$if(email)$
  \email{$email$} \textperiodcentered\ 
$endif$

$if(mobile)$
  \phone{$mobile$} \textperiodcentered\ 
$endif$

$if(github)$
	\github{$github$} \textperiodcentered\
$endif$

$if(linkedin)$
  \linkedin[$linkedin$]{https://www.linkedin.com/in/$linkedin$ }
$endif$
}

$body$

%\section{\faGraduationCap\  教育背景}
%\datedsubsection{\textbf{上海交通大学}, 上海}{2013 -- 至今}
%\textit{在读硕士研究生}\ 信息与通信工程, 预计 2016 年 3 月毕业
%\datedsubsection{\textbf{西安电子科技大学}, 西安, 陕西}{2009 -- 2013}
%\textit{学士}\ 通信工程

%\section{\faUsers\ 实习/项目经历}
%\datedsubsection{\textbf{黑科技公司} 上海}{2015年3月 -- 2015年5月}
%\role{实习}{经理: 高富帅}
%xxx后端开发
%\begin{itemize}
%  \item 实现了 xxx 特性
%  \item 后台资源占用率减少8\%
%  \item xxx
%\end{itemize}

%\datedsubsection{\textbf{分布式科学上网姿势}}{2014年6月 -- 至今}
%\role{Golang, Linux}{个人项目，和富帅糕合作开发}
%\begin{onehalfspacing}
%分布式负载均衡科学上网姿势, https://github.com/cyfdecyf/cow
%\begin{itemize}
%  \item 修复了连接未正常关闭导致文件描述符耗尽的 bug
%  \item 使用Chord 哈希 URL, 实现稳定可靠地分流
%  \item xxx (尽量使用量化的客观结果)
%\end{itemize}
%\end{onehalfspacing}

%\datedsubsection{\textbf{\LaTeX\ 简历模板}}{2015 年5月 -- 至今}
%\role{\LaTeX, Python}{个人项目}
%\begin{onehalfspacing}
%优雅的 \LaTeX\ 简历模板, https://github.com/billryan/resume
%\begin{itemize}
%  \item 容易定制和扩展
%  \item 完善的 Unicode 字体支持，使用 \XeLaTeX\ 编译
%  \item 支持 FontAwesome 4.5.0
%\end{itemize}
%\end{onehalfspacing}

% Reference Test
%\datedsubsection{\textbf{Paper Title\cite{zaharia2012resilient}}}{May. 2015}
%An xxx optimized for xxx\cite{verma2015large}
%\begin{itemize}
%  \item main contribution
%\end{itemize}

%\section{\faCogs\ IT 技能}
% increase linespacing [parsep=0.5ex]
%\begin{itemize}[parsep=0.5ex]
%  \item 编程语言: C == Python > C++ > Java
%  \item 平台: Linux
%  \item 开发: xxx
%\end{itemize}

%\section{\faHeartO\ 获奖情况}
%\datedline{\textit{第一名}, xxx 比赛}{2013 年6 月}
%\datedline{其他奖项}{2015}

%\section{\faInfo\ 其他}
% increase linespacing [parsep=0.5ex]
%\begin{itemize}[parsep=0.5ex]
%  \item 技术博客: http://blog.yours.me
%  \item GitHub: https://github.com/username
%  \item 语言: 英语 - 熟练(TOEFL xxx)
%\end{itemize}

%% Reference
%\newpage
%\bibliographystyle{IEEETran}
%\bibliography{mycite}
\end{document}
