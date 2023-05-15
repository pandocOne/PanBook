\documentclass[$if(fontsize)$$fontsize$,$endif$$if(lang)$$lang$,$endif$CJKutf8]{$documentclass$}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
\usepackage[top=1in,bottom=1in,left=1.25in,right=1.25in]{geometry}
\usepackage{float}
\usepackage{fontspec}
\newfontfamily\zhfont[BoldFont=NotoSansCJKsc-Bold,ItalicFont=STKaiti]{STFangsong}
\newfontfamily\zhpunctfont{STFangsong}
% \setmainfont{Times New Roman}
\usepackage{indentfirst}
\usepackage{zhspacing}
% \zhspacing

\usepackage{titlesec}
\titleformat{\section}[block]{\LARGE\bfseries\filcenter}{}{1em}{}
\titleformat{\subsection}[hang]{\bfseries}{}{1em}{}

\usepackage{tikz}
\usetikzlibrary{decorations.text}
\usetikzlibrary{shapes,backgrounds}
\usepackage{pgfplots}
\usepackage{amsmath}
\pgfplotsset{compat=newest}

\usepackage{longtable}

\setlength{\parindent}{2em}

\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\usepackage{fancyvrb}
\DefineVerbatimEnvironment{verbatim}{Verbatim}
{frame=none,
baselinestretch=1,
fontfamily="Souce Code Pro"
fontsize=\small,
xleftmargin=5pt,
xrightmargin=5pt,
rulecolor=\color{grey},
framesep=5mm,
numbers=left,
samepage=true
}


% \usepackage[usenames, dvipsnames]{color}
% \definecolor{mygray}{gray}{0.9}

\usepackage{listings}
\lstset{ % General setup for the package
  language=perl,
  basicstyle=\small\sffamily,
  numbers=left,
  numberstyle=\tiny,
  frame=tb,
  tabsize=4,
  columns=fixed,
  showstringspaces=false,
  showtabs=false,
  keepspaces,
  commentstyle=\color{red},
  keywordstyle=\color{blue},
  backgroundcolor=\color{mygray},
  rulecolor=\color{cyan},
  % fancyvrb=true,
  breaklines=true
}

\let\quoteOLD\quote
\def\quote{\quoteOLD\small}

\usepackage{lmodern}
\usepackage{amssymb,amsmath}
\usepackage{ifxetex,ifluatex}
\usepackage{fixltx2e} % provides \textsubscript

% use microtype if available
\IfFileExists{microtype.sty}{\usepackage{microtype}}{}
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[utf8]{inputenc}
$if(euro)$
  \usepackage{eurosym}
$endif$
\else % if luatex or xelatex
  \usepackage{fontspec}
  \ifxetex
    \usepackage{xltxtra,xunicode}
  \fi
  \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
  \newcommand{\euro}{€}
$if(mainfont)$
    \setmainfont{$mainfont$}
$endif$
$if(sansfont)$
    \setsansfont{$sansfont$}
$endif$
$if(monofont)$
    \setmonofont{$monofont$}
$endif$
$if(mathfont)$
    \setmathfont{$mathfont$}
$endif$
\fi

$if(geometry)$
\usepackage[$for(geometry)$$geometry$$sep$,$endfor$]{geometry}
$endif$

$if(natbib)$
\usepackage{natbib}
\bibliographystyle{plainnat}
$endif$

$if(biblatex)$
\usepackage{biblatex}
$if(biblio-files)$
\bibliography{$biblio-files$}
$endif$
$endif$

$if(listings)$
\usepackage{listings}
$endif$

$if(lhs)$
\lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small\ttfamily}}{}
$endif$
$if(highlighting-macros)$
$highlighting-macros$
$endif$
$if(verbatim-in-note)$
\usepackage{fancyvrb}
$endif$
$if(fancy-enums)$
% Redefine labelwidth for lists; otherwise, the enumerate package will cause
% markers to extend beyond the left margin.
\makeatletter\AtBeginDocument{%
  \renewcommand{\@listi}
    {\setlength{\labelwidth}{4em}}
}\makeatother
\usepackage{enumerate}
$endif$
$if(tables)$
\usepackage{ctable}
\usepackage{float} % provides the H option for float placement
$endif$
\let\Oldincludegraphics\includegraphics
$if(graphics)$
\usepackage{graphicx}
% We will generate all images so they have a width \maxwidth. This means
% that they will get their normal width if they fit onto the page, but
% are scaled down if they would overflow the margins.
\makeatletter
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth
\else\Gin@nat@width\fi}
\makeatother
\let\Oldincludegraphics\includegraphics
\renewcommand{\includegraphics}[1]{\Oldincludegraphics[width=\maxwidth]{#1}}
$endif$
\ifxetex
  \usepackage[setpagesize=false, % page size defined by xetex
              unicode=false, % unicode breaks when used with xetex
              xetex]{hyperref}
\else
  \usepackage[unicode=true]{hyperref}
\fi
\hypersetup{breaklinks=true,
            bookmarks=true,
            pdfauthor={$author-meta$},
            pdftitle={$title-meta$},
            colorlinks=true,
            urlcolor=$if(urlcolor)$$urlcolor$$else$blue$endif$,
            linkcolor=$if(linkcolor)$$linkcolor$$else$magenta$endif$,
            pdfborder={0 0 0}}
$if(links-as-notes)$
% Make links footnotes instead of hotlinks:
\renewcommand{\href}[2]{#2\footnote{\url{#1}}}
$endif$
$if(strikeout)$
\usepackage[normalem]{ulem}
% avoid problems with \sout in headers with hyperref:
\pdfstringdefDisableCommands{\renewcommand{\sout}{}}
$endif$
\setlength{\parindent}{2em}
\setlength{\parskip}{6pt plus 2pt minus 1pt}
\renewcommand{\baselinestretch}{1.4}
\setlength{\emergencystretch}{3em}  % prevent overfull lines
$if(numbersections)$
$else$
\setcounter{secnumdepth}{0}
$endif$
$if(verbatim-in-note)$
\VerbatimFootnotes % allows verbatim text in footnotes
$endif$
$if(lang)$
\ifxetex
  \usepackage{polyglossia}
%  \setmainlanguage{$mainlang$}
\else
  \usepackage[$lang$]{babel}
\fi
$endif$
$for(header-includes)$
$header-includes$
$endfor$

$if(title)$
\title{$title$}
$endif$
\author{$for(author)$$author$$sep$ \and $endfor$}
\date{$date$}

\usepackage{afterpage}

\newcommand\Star[4][]{
\path[#1] (#2,#3) + (18:#4) -- +(54:#4*0.4)
       -- +(90 :#4) -- +(126:#4*0.4)
       -- +(162:#4) -- +(198:#4*0.4)
       -- +(234:#4) -- +(270:#4*0.4)
       -- +(306:#4) -- +(344:#4*0.4) -- cycle;}

\graphicspath{{/tmp/}}
\begin{document}
\zhfont
\thispagestyle{empty}
% \pagenumbering{gobble}
\pagenumbering{arabic}

$for(include-before)$
$include-before$
$endfor$

\centerline{\color{red}\Huge\textbf{$com$}}
\vspace{1em}
\centerline{$seq$}

\vspace{4pt}
{\color{red}\hrule height 1pt}
\vspace{1pt}
{\color{red}\hrule height 0.3pt}

% {\color{red}\rule{\linewidth}{1pt}}
% {\color{red}\rule[1.5em]{\linewidth}{.3pt}}

\section{$topic$}

\bigskip

\setlength{\parindent}{0em}
{$to$：}
\setlength{\parindent}{2em}

$body$

\bigskip
\bigskip

% \hfill{\includegraphics[width=10em]{xytxcf.png}}
% \vspace*{-5\baselineskip}

\hfill{$com$}
\par
\hfill{$date$}

\vspace*{-5\baselineskip}

\begin{hfill}
\begin{tikzpicture}
\color{red}
% circle
\draw[line width=.8mm,color=red] (2.5,0) circle (2cm);
% \draw[fill=red,even odd rule] (0,0) circle (2cm) (0:1) arc (0:360:1);

% main text
\draw[-latex,white,postaction={decorate},decoration={
  text along path,reverse path,
  text={$com$},text align=center,text color=red}]
  (4,0) arc [start angle=0,end angle=180,radius=1.5];

% \node[star,fill=red,minimum width=2em] at (2.5,0) {};

\draw[-latex,white,postaction={decorate},decoration={
  text along path,
  text={{}|{\Large}|{专用章} {}},text align=center, text color=red}]
  (1,-1) -- (4,-1);

\Star[fill=red,draw]{2.5}{0}{.4}

% fill star with random dots
\foreach \i in {1,...,100}
  \fill [color=white] (2.3+rnd*0.5, rnd*0.5 - 0.2) circle (.25pt);

% fill circle with random dots
\foreach \i in {1,...,500}
  \fill [color=white] (2.5,0) + (rnd*360: 1.95 + rnd * 0.1) circle (.25pt);
\end{tikzpicture}
\end{hfill}

\setlength{\parindent}{0em}
\vfill

\textbf{主题词：$for(keywords)$ $keywords$\quad $endfor$}
$if(secret)$\hfill{\textbf{$secret$}}$endif$
\vspace{5pt}
\hrule
\noindent{抄\quad 送： $cc$}
\vspace{5pt}
\hrule
$com$
\hfill{$date$}
\vspace{5pt}
\hrule

$for(include-after)$
$include-after$
$endfor$

\end{document}
