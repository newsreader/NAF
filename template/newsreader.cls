\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common/newsreader}
              [2002/06/10 v1
                Kyoto LaTeX document class]

\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}
% Execute the code of the options:
\ProcessOptions
\LoadClass[12pt,twoside,openwight,a4paper]{article}

% Some includes and definitions
%\usepackage{epsfig}
\usepackage{a4wide}
%\usepackage{graphicx}
\usepackage{lastpage}
\usepackage{fancyhdr}

\usepackage{amssymb}
\usepackage{xspace}
\usepackage[final]{graphicx}
\usepackage{url}
\usepackage{colortbl}
\usepackage{setspace}

% Packages to beautify PDF
%\usepackage{times}
\usepackage[OT1]{fontenc}
\usepackage{type1cm}






\newcommand{\DocTitle}[1]   {\renewcommand{\DH@title}{#1}}
\newcommand{\DocDate}[1]    {\renewcommand{\DH@date}{#1}}
\newcommand{\DocNumber}[1]  {\renewcommand{\DH@number}{#1}}
\newcommand{\DocVersion}[1] {\renewcommand{\DH@version}{#1}}
\newcommand{\DH@title}{}
\newcommand{\DH@date}{}
\newcommand{\DH@number}{}
\newcommand{\DH@version}{}
\@onlypreamble{\DocTitle}
\@onlypreamble{\DocDate}
\@onlypreamble{\DocNumber}
\@onlypreamble{\DocVersion}

% \newcommand{\ps@kyoto}{%
%   \renewcommand{\@oddhead}{%
%     \begin{minipage}{\textwidth}\normalfont
%       \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}%
%           l@{\extracolsep{0pt}:~}l@{}}%
%         \DH@number     &    Version    & \DH@version \\
%         \DH@title      &    Page       & \thepage    \\
%       \end{tabular*}\vspace{0.5ex} \rule{\textwidth}{0.6pt}%
%     \end{minipage}}
%   \renewcommand{\@evenhead}{\@oddhead}
%   \renewcommand{\@oddfoot}{\small \em ICT-211423 - KYOTO - Knowledge Yielding Ontologies for Transition-based Organization}
%   \renewcommand{\@evenfoot}{\@oddfoot}
%   }
% \pagestyle{kyoto}

\setlength{\headheight}{3\baselineskip}
\setlength{\headsep}{3em}

\fancyhf{}
\rhead{\thepage/\pageref{LastPage}}
\lfoot{NewsReader: ICT-316404}
\rfoot{\today}
\lhead{\DH@title}

\pagestyle{fancy}
% \let\DH@section=\section
% \renewcommand{\thepage}{\thesection-\arabic{page}}
% \renewcommand{\section}{\newpage\setcounter{page}{1}\DH@section}


% %%%%%%%%%%%%%%%%%%%%
% Definition of the revisions environment
% %%%%%%%%%%%%%%%%%%%%
%
% Revision number of the document
%
\newcommand{\@nwrrevisionnum}{XX.YY}
\newcommand{\nwrrevisionnum}[1]{\renewcommand{\@nwrrevisionnum}{#1}}
% write the
\newcommand{\@nwrrevnumwriteaux}[1]{%
\def\@ccciempty{}%
\def\@cccciempty{#1}%
\ifx\@ccciempty\@cccciempty
 \@ccciempty
\else
% notice the use of \gdef to make the defined symbol global. Otherwise
% it is local and the default value is used.
 \protected@write\@auxout{}{\string\gdef\string\@nwrrevisionnum{#1}}
\fi
}
%
% Revision macro: \nwrrevision{version}{date}{description}{by}{affected}
%
\newcommand{\nwrrevision}[5]{#1 \@nwrrevnumwriteaux{#1} & #2 & #3 & #4 & #5 \\\hline}
%
% Revisions environment
%
\newenvironment{nwrrevisions}{%
\section*{Table of Revisions}
\addtocontents{toc}{\protect\contentsline{section}{{Table of Revisions}}{\thepage}}
%
\begin{footnotesize}
\renewcommand{\arraystretch}{1.2}
\begin{tabular}{|>{\columncolor[gray]{.94}}l|l|p{0.4\textwidth}|p{0.15\textwidth}|p{0.17\textwidth}|}\hline%
\rowcolor[gray]{.94}
\textbf{Version} & \textbf{Date} & \textbf{Description and reason} & \textbf{By} & \textbf{Affected sections} \\ \hline
}{%
\end{tabular}%
\end{footnotesize}
}

