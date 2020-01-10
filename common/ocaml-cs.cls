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
\RequirePackage[scaled=0.8]{DejaVuSans}
\RequirePackage[scaled=0.8]{DejaVuSansMono}
\RequirePackage{mdframed} % nice frames
\RequirePackage[nobottomtitles]{titlesec} % better titles
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep, topsep=0pt}

% page setting
\RequirePackage[a4paper,landscape,margin=1cm,includehead,headsep=2ex,nofoot]{geometry}

\setlength{\headheight}{20.1pt}
\setlength{\headsep}{10pt}


% multicol parameters
% These lengths are set only within the two main columns
%\setlength{\columnseprule}{0.25pt}
%\setlength{\premulticols}{1pt}
%\setlength{\postmulticols}{1pt}
%\setlength{\multicolsep}{1pt}
%\setlength{\columnsep}{5pt}

\renewcommand{\familydefault}{\sfdefault} % everything sans-serif
% \renewcommand{\rmdefault}{garamond}

%Url handling
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  urlcolor=black,
  linkcolor=black,
  citecolor=black
}

%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Page & main style   %
%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\newcommand{\makeheader}[3]{
  \fancyhead[L]{
    \begin{minipage}{150pt}
     \includegraphics[width=24mm]{../licence/by-sa.pdf}
    \end{minipage}
  }
  \fancyhead[C]{
   \Large{#1}
  }
  \fancyhead[R]{
   {\scriptsize
    #2 $\cdot$ Revision #3 \copyright\ 2019 $\quad$
    \begin{minipage}{30pt}
     \vspace{-3pt}
     \includegraphics[width=\textwidth]{\logoOCP} %defined at bottom
    \end{minipage}
   }}
  \fancyfoot[L]{}
  \fancyfoot[C]{}
  \fancyfoot[R]{}
}

% font size -> set to equivalent to footnotesize of 10 pt
% it affect only the \\normalsize command, all are still relative to default's
% article one (10pt)
\newcommand\articlenormalsize{\fontsize{10pt}{12pt}\selectfont}
\renewcommand\normalsize{\footnotesize}

% redefine sections padding
\makeatletter
\renewcommand{\section}{\@startsection{section}{1}{0mm}%
                                {-1ex plus -.5ex minus -.2ex}%
                                {0.5ex}%
                                {\normalfont\large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{4mm}%
                                {-1ex}%
                                {0.5ex}%
                                {\normalfont\articlenormalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{16mm}%
                                {-1ex plus -.5ex minus -.2ex}%
                                {1ex plus .2ex}%
                                {\normalfont\small\bfseries}}
\makeatother

%\pagestyle{empty}
% set section counter to 0
\setcounter{secnumdepth}{0}
% set padding of indent & skip
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5ex}
\renewcommand{\smallskip}{\vspace{0.25ex}}

% Text at right
\raggedright

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Define some colors
\RequirePackage{color}
\definecolor{cinnamon}{rgb}{0.82, 0.41, 0.12}
\definecolor{gray05}{gray}{0.05}
\definecolor{gray20}{gray}{0.20}
\definecolor{gray25}{gray}{0.25}
\definecolor{gray30}{gray}{0.30}
\definecolor{gray40}{gray}{0.40}
\definecolor{gray50}{gray}{0.50}
\definecolor{gray75}{gray}{0.75}
\definecolor{persiangreen}{rgb}{0.0, 0.65, 0.58}
\definecolor{pinegreen}{rgb}{0.0, 0.47, 0.44}
\definecolor{richblack}{rgb}{0.0, 0.25, 0.25}
\definecolor{tenne}{rgb}{0.8, 0.34, 0.0}
\definecolor{tyrianpurple}{rgb}{0.4, 0.01, 0.24}
\definecolor{vermilion}{rgb}{0.89, 0.26, 0.2}
\definecolor{deepjunglegreen}{rgb}{0.0, 0.29, 0.29}

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

\newcommand{\vb}[1]{{\usefont{T1}{DejaVuSansMono-TLF}{b}{n} #1}}

\newenvironment{libcomments}{\begin{itemize}[topsep=-10000pt]}{\end{itemize}}

% tabulrax package, needed for breaking newlines without setting the columns
% size
\RequirePackage{tabularx}

% table for code vs explanation
% X column type if for breaking line (tabularx)
% \extracolsep defines the padding size when set (0 for the fst, 5pt for the snd)
\newcommand\listvav[1]{
  \vspace{\parskip}
  \begin{tabularx}{\dimexpr\columnwidth-.33\columnsep}{@{}l@{\extracolsep{5pt}}>{\raggedright\arraybackslash}X@{}}
  #1
  \end{tabularx}
  \vspace{\parskip}
}

% Command to indent once
% As the way to deactive paragraph indentation is to set size of \indent to 0,
% also ragged right deactivate indentation, we can't use it. Redefining then a
% new indent command manually \dnet because c'est un \dent
\newcommand\dent{\hspace{10pt}}

% Within \listvav, for long comments: comment on the next line, left-indented
% e.g. \splt{\lst!command!}{long comment like a paragraph} \\
\newcommand\splt[2]{
  \multicolumn{2}{@{\extracolsep{0pt}}l}{#1} \\
  \multicolumn{2}{@{\dent\extracolsep{0pt}}>{\raggedright\hsize=\dimexpr\columnwidth-.33\columnsep-16pt\relax}X}{#2}
}
% Within \listvav, for long commands: put on its own line
% e.g. \linecmd{\lst!long text!} & comment aligned below \\
\newcommand\linecmd[1]{
  \multicolumn{2}{@{\extracolsep{0pt}}l}{#1} \\
}

%% CODE
\RequirePackage{listings}

\lstdefinelanguage{neutral}{
  keywords={};
}

%Define opam keywords
\lstdefinelanguage{opam}{
  alsoletter={-},
  keywords={opam},
  % commands
  keywords=[2]{
    clean,
    config,
    env,
    exec,
    init,
    install,
    lint,
    list,
    lock,
    pin,
    reinstall,
    remove,
    repository,
    show,
    source,
    switch,
    unpin,
    update,
    upgrade,
    var,
    % plugins
    depext,
    publish,
  },
  % subcommands
  keywords=[3]{
    add,
    add-constraint,
    cache,
    create,
    edit,
    export,
    filter,
    import,
    index,
    list-available,
    report,
    set,
    set-global,
    set-repos,
    set-url,
  },
  % generic arguments names
  keywords=[4]{
    args,
    command,
    compiler,
    dir,
    flds,
    name,
    patterns,
    pkg,
    pkgs,
    rank,
    root,
    sw,
    url,
    v,
    val,
    version,
    file
  },
  % plugins
  keywords=[5]{
  },
}

%Define opam keywords
\lstdefinelanguage{opam-file}{
  alsoletter={-:},
  string=[b]{"""},
  string=[b]{"},
  keepspaces,
  showstringspaces=false,
  comment=[l]\#,
  % fields
  keywords=[3]{
    version:,
    opam-version:,
    name:,
    version:,
    synopsis:,
    description:,
    maintainer:,
    authors:,
    license:,
    homepage:,
    bug-reports:,
    dev-repo:,
    depends:,
    build:,
    install:,
    depopts:,
    pin-depends:,
    extra-sources:,
    extra-files:,
    depexts:,
    tags:,
    substs:,
    patches:,
    run-test:,
    pin-depends:,
    conflicts:,
    available:,
    build-env:,
    flags:,
    post-messages:,
    % sections
    url,
    extra-source,
    % not "opam" fields, for .opam/config
    global-variables:,
    eval-variables:,
  },
  % variables
  keywords=[5]{
    true,false,
    %global
    opam-version,root,jobs,make,arch,os,os-distribution,os-family,os-version,
    %switch
    switch,user,group,prefix,lib,bin,sbin,share,doc,etc,man,toplevel,stublibs,
    %package
    name,version,depends,installed,enable,pinned,build,hash,dev,build-id,
    bin,sbin,lib,man,doc,share,etc,
    %depends
    with-test,with-doc,build,post,
  },
  % placeholders
  keywords=[4]{
    bool-var,
    cmds,
    condition,
    deps,
    pkg,
    undef,
    var,
  },
}

\lstset{
  basicstyle=\usefont{T1}{DejaVuSansMono-TLF}{m}{n}\color{gray25},
  escapeinside={@<}{>@},
  aboveskip=\parskip,
}

% alias for lstinline
%\lstMakeShortInline[language=opam]!
\newcommand\lst\lstinline

%%% OPTIONS /!\ need to be at bottom of cls
% Option `nbcode`
\DeclareOption{nbcode}{
  \lstset{
    keywordstyle=\color{gray25},
    keywordstyle=[2]\bfseries\color{gray05},
    keywordstyle=[3]\bfseries\color{gray25},
    keywordstyle=[4]\itshape,
    keywordstyle=[5]\color{gray25},
    commentstyle=\color{gray50},
    stringstyle=\itshape\color{gray25},
  }

  \newcommand\logoOCP{../common/fig/ocamlpro_carre_noir.pdf}
}

% Option `colcode`
\DeclareOption{colcode}{
  \lstset{
    keywordstyle=\bfseries\color{gray50},
    keywordstyle=[2]\bfseries\color{tenne},
    keywordstyle=[3]\bfseries\color{pinegreen},
    keywordstyle=[4]\itshape\color{black},
    keywordstyle=[5]\color{tyrianpurple},
    commentstyle=\color{tenne},
    stringstyle=\itshape\color{gray50},
  }

  \newcommand\logoOCP{../common/fig/ocamlpro_carre_bleu.pdf}
}

% Execute class options
\ProcessOptions\relax
