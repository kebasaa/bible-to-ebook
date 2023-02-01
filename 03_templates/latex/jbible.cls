\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jbible}[2022/11/11 Jonathan D. Muller's journaling Bible class]

%% Required packages
%% - - - - - - - - -
\RequirePackage[T1]{fontenc}
\RequirePackage[switch*,modulo,pagewise]{lineno}  % Every single line is numbered
\RequirePackage[utf8x]{inputenc}

\RequirePackage{float}           % To place figures in the text

\RequirePackage{rotating} % Rotation of tables
\RequirePackage{array}    % Used for tables
\RequirePackage{booktabs} % Used for tables
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\abovetopsep}{4pt}
\RequirePackage{tabularx} % Used for tables
\renewcommand{\tabularxcolumn}[1]{m{#1}}
\RequirePackage{multirow} % Used for tables
\RequirePackage{makecell} % Used for tables

\RequirePackage{xcolor}
\definecolor{darkblue}{HTML}{0f0080}
\definecolor{nightblue}{HTML}{0b005f}
\definecolor{darkbrown}{HTML}{693300}
\definecolor{darkgrey}{HTML}{828282}

\RequirePackage{lettrine}

% Prepare geometry to set margin options later
\RequirePackage[a4paper]{geometry}

%% Declare options
%% - - - - - - - -
\DeclareOption{std}{\providecommand{\texttype}{Preprint}
                     \PassOptionsToClass{onecolumn}{book}
                     \PassOptionsToClass{twoside}{book}
                     \PassOptionsToClass{12pt}{book}
                     \providecommand{\linespace}{\linespread{1.3}}
                     \providecommand{\setmargins}{\geometry{top = 3.0cm, bottom = 2.0cm, outer = 7.0cm, inner = 2.0cm}}
                     \providecommand{\bibverse}[1]{\textsuperscript{#1}} % Bible verse
                     \providecommand{\bibchap}[1]{\lettrine[lraise=0.1,lines=2]{\textbf{#1}}{}} % Bible chapter
}

\DeclareOption{noverses}{\providecommand{\texttype}{Preprint}
                     \PassOptionsToClass{onecolumn}{book}
                     \PassOptionsToClass{twoside}{book}
                     \PassOptionsToClass{12pt}{book}
                     \providecommand{\linespace}{\linespread{1.3}}
                     \providecommand{\setmargins}{\geometry{top = 3.0cm, bottom = 2.0cm, outer = 7.0cm, inner = 2.0cm}}
                     \providecommand{\bibverse}[1]{} % Bible verse
                     \providecommand{\bibchap}[1]{} % Bible chapter
                     \linenumbers
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} % Pass all other options to the book class
\ProcessOptions\relax                     % Execute all the previous options (required before LoadClass)

%% Page setup based on standard book class
%% - - - - - - - - - - - - - - - - - - - - - -
\LoadClass[a4paper]{book}
\setmargins
\linespace

\RequirePackage[bookmarksnumbered,
            colorlinks,
            linkcolor=nightblue,
            citecolor=nightblue,
            filecolor=black,
            urlcolor=nightblue,
            pdftitle={Journaling Bible}%,
            %breaklinks=true%,
            %pdfpagelayout=TwoPageRight%,
            %pdfstartpage=9
            ]{hyperref}
\urlstyle{rm}

% Reduce spacing in TOC
\RequirePackage{tocloft}
\renewcommand\cftchapafterpnum{\vskip2pt}
\renewcommand\cftsecafterpnum{\vskip2pt}

% Language options
\RequirePackage[british]{babel}
\selectlanguage{English}

% Define part titles for the header
\newcommand*\parttitle{}
\let\origpart\part
\renewcommand*{\part}[2][]{%
   \ifx\\#1\\% optional argument not present?
      \origpart{#2}%
      \renewcommand*\parttitle{#2}%
   \else
      \origpart[#1]{#2}%
      \renewcommand*\parttitle{#1}%
   \fi
}
% Chapter without number, but part of the TOC
\newcommand{\nonumchapter}[1]{
    \chapter*{#1}
    \phantomsection
    \addcontentsline{toc}{chapter}{#1}
    \chaptermark{#1}
}
\newcommand{\nonumsection}[1]{
    \section*{#1}
    \phantomsection
    \addcontentsline{toc}{section}{#1}
    \sectionmark{#1}
}

\RequirePackage{etoolbox}
\patchcmd{\part}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{}

% Header formatting (plain title page and normal page)
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{ % Part and chapter pages, no header
   \fancyhf{}
}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}{  % Normal pages
   \fancyhf{}
   \fancyhead[RO]{\textsc{\leftmark}}
   \fancyhead[LE]{\textsc{\parttitle}}
   \fancyhead[RE,LO]{\thepage}
}
\fancyhf{} % No idea why I have to repeat this so it works...
\fancyhead[RO]{\textsc{\leftmark}}
\fancyhead[LE]{\textsc{\parttitle}}
\fancyhead[RE,LO]{\thepage}
\renewcommand\chaptermark[1]{\markboth{#1}{}}

% Control spacing between paragraphs
\setlength{\parskip}{1em}

% Remove widows and orphans
\widowpenalty10000
\clubpenalty10000

% Margin notes with line
\RequirePackage{etoolbox}
% patching the OR of LaTeX:
\makeatletter
\patchcmd{\@addmarginpar}%
    {\box \@marbox}%
    {\hbox{%
        \ifmpar@rule@rside
        \hskip-\mparrulefactor\marginparsep\mparrule
        \hskip\mparrulefactor\marginparsep
        \fi
                          \box \@marbox
        \ifmpar@rule@lside
        \hskip\mparrulefactor\marginparsep\mparrule
        \fi}%
     \global\mpar@rule@lsidefalse
     \global\mpar@rule@rsidefalse
    }%
    {\typeout{*** SUCCESS ***}}{\typeout{*** FAIL ***}}
\patchcmd{\@addmarginpar}%
    {\global\setbox\@marbox\box\@currbox}%
    {\global\setbox\@marbox\box\@currbox
     \global\mpar@rule@lsidetrue
     \else
     \global\mpar@rule@rsidetrue
    }%
    {\typeout{*** SUCCESS ***}}{\typeout{*** FAIL ***}}
\newif\ifmpar@rule@lside
\newif\ifmpar@rule@rside
\makeatother
% \marginparrule generates the \vrule but should use no space horizontally
% using color is just for fun ...
\newcommand\mparrule{\hskip-2pt\vrule width 2pt\hskip-2pt}
% placement factor: .5 places the rule midway in the space made available 
% by \marginparsep
\newcommand\mparrulefactor{.4}
% space between text and margin note
\marginparsep=2em
\newcommand\mnote[1]{\marginpar{\textit{#1}}}