% TODO: compile list of required packages
% xecv.cls -- a clean and simple CV class for XeLaTeX.
%
% Credits:
%   Dario -- http://nitens.org/taraborelli/cvtex
% Usage:
%  1. Place this file in the same directory as your TeX file.
%  2. Include this in your preamble:
%     \author{My Name}
%     \documentclass{xecv}
%  3. TODO Use the following commands.
%
% Author: Jon-Michael Deldin <dev@jmdeldin.com>
% Date:   2010-11-14

\ProvidesClass{xecv}

%
% based on the article class
%
\LoadClass[10pt]{article}

%
% for width-conforming tables
%
\usepackage{tabularx}

%
% xelatex
%
\usepackage{fontspec}
\usepackage{xunicode}
\usepackage{xltxtra}
\defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}

\setromanfont[Ligatures={Common}, Numbers={OldStyle}, Variant=01]{Minion Pro}
\setmonofont[Scale=0.8]{Monaco}

%
% margins
%
\usepackage[top=1.00in,right=1.00in,bottom=0.80in,left=1.00in]{geometry}

%
% turn off paragraph indents
%
\setlength\parindent{0in}

%
% access author, date, and title with \@<field>
%
\makeatletter

%
% hyperref setup
\usepackage[
  bookmarks=true, % to enable bookmarks, change \section* to \section
  breaklinks,     % allows link text to break across lines
  colorlinks,     % color the links instead of placing a box around them
]{hyperref}
\hypersetup{
  citecolor=magenta, % bib-citations
  filecolor=magenta, % local-file links
  linkcolor=magenta, % in-text
  urlcolor=magenta,  % URL links
}

%
% header & footer
%
\usepackage{fancyhdr}
\pagestyle{fancy}

% this may need adjustment depending on the header content
\setlength{\headheight}{23pt}

% turn off the border
\renewcommand{\headrulewidth}{0pt}

\lhead{\LARGE \bf \@author}
\chead{}
\rhead{
  \footnotesize
  % \href{mailto:\email}{\email}
  \begin{tabularx}{2in}{l r}
    \streetfield & \phone \\
    \cityfield   & \href{mailto:\email}{\email}
  \end{tabularx}
}
\lfoot{}
\cfoot{}
\rfoot{}

%
% command: \xesection{Education} -- section headers
%
\usepackage{textcase}
\newcommand{\xesection}[1]{ \section*{#1} }

%
% command: \amp -- italicized ampersand
%
% NB: Don't use this when in an emph environment.
\newcommand{\amp}{ \emph{\&} }

%
% command: \daterange{from}{to} -- a small date
%
\newcommand{\daterange}[2]{ \footnotesize{#1\textendash#2} }

%
% command: \job{title}{employer}{location} -- "/Title/ at Emp, Loc
%
\newcommand{\job}[3]{\emph{#1} at #2, #3}

%
% command: \uni{University} -- formatting for university or school
%
\newcommand{\uni}[1]{#1}

%
% command: \coursework{Algorithms, ...} -- "Relevant coursework: ..."
%
\newcommand{\coursework}[1]{ \emph{Relevant coursework:} #1 }

%
% environment: joblist -- customized list for job section
%
\newenvironment{joblist}{
  \small
  \begin{list}{$\ast$}{\itemsep=4pt \parskip=-100pt \parsep=0pt \leftmargin=0.0in \rightmargin=0.0in}
}{\end{list}}

%
% environment: edlist -- list for ed section (no bullets)
%
\newenvironment{edblock}{
  \small
  \begin{list}{}{\topsep=0.00in \itemsep=0.00mm \itemsep=0in \parsep=0in \parskip=-0.5in \partopsep=0.0in \leftmargin=0.3in \rightmargin=0.0in}
}{\end{list}}

%
% command: \edtitle
%
\newcommand{\edtitle}[1]{\small \emph{#1}}

%
% default values for the header -- these should be redefined in your tex file
% with \renewcommand{\streetfield}{My Street}.
%
\newcommand{\streetfield}[0]{123 Easy St}
\newcommand{\cityfield}[0]{Missoula, MT 59812}
\newcommand{\phone}[0]{406-555-5555}
\newcommand{\email}[0]{me@example.com}

% vim: se ft=tex et sts=2 sw=2:
