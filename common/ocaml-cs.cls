\NeedsTeXFormat{LaTeX2e}
% Arguments are : nbcode/colcode
\ProvidesClass{ocaml-cs}

% Based on article class
\LoadClass{article}

% Packages
\RequirePackage[T1]{fontenc}
\RequirePackage{multicol}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{epsfig}
\RequirePackage{upquote} % Uncurly the quotes
\RequirePackage[scaled=0.8]{DejaVuSansMono}
\RequirePackage{mdframed} % nice frames
\RequirePackage[nobottomtitles]{titlesec} % better titles
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep, topsep=0pt}

% page setting
\RequirePackage[a4paper,landscape]{geometry}
\geometry{top=1cm,left=1cm,right=1cm,bottom=1cm}

\pagestyle{empty}

% redefine sections padding
\makeatletter
\renewcommand{\section}{\@startsection{section}{1}{0mm}%
                                {-1ex plus -.5ex minus -.2ex}%
                                {0.5ex plus .2ex}%x
                                {\normalfont\large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{0mm}%
                                {-1explus -.5ex minus -.2ex}%
                                {0.5ex plus .2ex}%
                                {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{0mm}%
                                {-1ex plus -.5ex minus -.2ex}%
                                {1ex plus .2ex}%
                                {\normalfont\small\bfseries}}
\makeatother

% set section counter to 0
\setcounter{secnumdepth}{0}
% set padding of indent & skip
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt plus 0.5ex}

% multicol parameters
% These lengths are set only within the two main columns
%\setlength{\columnseprule}{0.25pt}
%\setlength{\premulticols}{1pt}
%\setlength{\postmulticols}{1pt}
%\setlength{\multicolsep}{1pt}
%\setlength{\columnsep}{5pt}

% Text at right & reduce size
\raggedright
\footnotesize

%Url handling
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  urlcolor=black,
  linkcolor=black,
  citecolor=black
}


%Define some colors
\RequirePackage{color}
\definecolor{gray75}{gray}{0.75}
\definecolor{gray50}{gray}{0.50}
\definecolor{gray25}{gray}{0.25}


% Header
\newcommand{\makeheader}[2]{
  \hspace{-2em}
  \begin{tabular}{l}
  \vspace{0cm}\epsfig{file=../licence/by-sa,width=24mm}\\
  \end{tabular}\vspace{-2mm}
  \hfill
  \hfill
  \Large{\textbf{#1}}
  \hfill
  \hfill
  \scriptsize
  OCaml v. 4.08.1 ---
  Revision #2 ---
  Copyright \copyright\ 2019 OCamlPro SAS
  ---
  {\bf \url{http://www.ocamlpro.com}}\\
  \hrule~\\
}

\newcommand\opam{\textsf{opam}~}

% verbatim
\RequirePackage{fancyvrb} % better verbatim
\newmdenv[bottomline=false,rightline=false]{topleft}
\newmdenv[topline=false,leftline=false]{bottomright}
\DefineVerbatimEnvironment{Verbacorner}{Verbatim}{}
\surroundwithmdframed[bottomline=false,rightline=false]{Verbacorner}
\fvset{commandchars=@\{\}}

\newenvironment{absolutelynopagebreak}
  {\par\nobreak\vfil\penalty0\vfilneg
   \vtop\bgroup}
  {\par\xdef\tpd{\the\prevdepth}\egroup
    \prevdepth=\tpd}

\newcommand{\vb}{\usefont{T1}{DejaVuSansMono-TLF}{b}{n}}

\newenvironment{libcomments}{\begin{itemize}[topsep=-10000pt]}{\end{itemize}}

% tabulrax package, needed for breaking newlines without setting the columns
% size
\RequirePackage{tabularx}

% table for code vs explanation
% X column type if for breaking line (tabularx)
% \extracolsep defines the padding size when set (0 for the fst, 5pt for the snd)
\newcommand\listvav[1]{
  \begin{tabularx}{\linewidth}{@{\extracolsep{0pt}}l@{\extracolsep{5pt}}X}
  #1
  \end{tabularx}
}

% Command to indent once
% As the way to deactive paragraph indentation is to set size of \indent to 0,
% also ragged right deactivate indentation, we can't use it. Redefining then a
% new indent command manually \dnet because c'est un \dent
\newcommand\dent{\hspace{10pt}}

% Command set a non table mapping code/explanation when code or comments are too long
% first argument is the wode (without lst!), second the comment
\newcommand\oneline[2]{
  \lst!#1! \\ \dent #2\\
}

%% CODE
\RequirePackage{listings}

%Define opam keywords
\lstdefinelanguage{opam}{
  keywords={
    env,
    init,
    install,
    lock,
    pin,
    switch,
    update,
    upgrade,
  },
  keywords=[2]{opam},
  keywords=[3]{
    create,
    list-available,
    export,
    import,
  },
  keywords=[4]{
    compiler,
    dir,
    pkg,
    url,
    ver,
    version,
  },
  keywordstyle=[4]\itshape,
}

\lstset{
  basicstyle=\ttfamily,
}

% alias for lstinline
\newcommand\lst\lstinline

%%% OPTIONS /!\ need to be at bottom of cls
% Option `nbcode`
\DeclareOption{nbcode}{
  \lstset{
    keywordstyle=[3]\color{gray25},
    keywordstyle=[2]\color{gray50},
    keywordstyle=\color{gray75},
  }
}

% Option `colcode`
\DeclareOption{colcode}{
  \lstset{
    keywordstyle=[3]\color{green},
    keywordstyle=[2]\color{red},
    keywordstyle=\color{blue},
  }
}

% Execute class options
\ProcessOptions\relax
