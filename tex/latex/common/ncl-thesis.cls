\ProvidesClass{ncl-thesis}[2018/05/07 Class for thesis of Newcastle University (UK)]
\newif\ifnclthesis@print
\DeclareOption{print}{\nclthesis@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
%
\RequirePackage{colors-ncl}
\RequirePackage{fancyhdr}
\ifnclthesis@print
	\PassOptionsToClass{twoside,final}{book}
	\PassOptionsToPackage{hidelinks}{hyperref}
\else
	\PassOptionsToClass{oneside}{book}
\fi
\LoadClass[
	11pt,
	a4paper,
	]{book}

\def\@university{\@empty}
\def\@supervisors{\@empty}
\newcommand{\university}[1]{\def\@university{#1}\global\let\university\@empty}
\newcommand{\supervisors}[1]{\def\@supervisors{#1}\global\let\supervisors\@empty}

\def\maketitle{%
	\begin{titlepage}
		\begin{center}%
			\let\footnote\thanks
			\includegraphics[width=0.5\textwidth]{logo-ncl}\par
			\vspace{.25cm}
			{\Large{\@university}\par}

			\vspace{2cm}

			{\huge\textbf{\@title}\par}

			\vfill

			{\LARGE\textbf{\@author}\par}
			\vspace{.5cm}
			{\Large Supervisors:\\\@supervisors\par}

			\vfill

			{\Large
			A thesis presented for the degree of\\
			Doctor of Philosophy\par}
			\vspace{.5cm}
			{\Large
			\@date\par}
		\end{center}%
	\end{titlepage}
}

% Header/footer styles using fancyhdr
\setlength{\headheight}{14pt}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE]{\leftmark}
\fancyhead[LO]{\rightmark}
\fancyhead[LE,RO]{\thepage}
% \renewcommand\headrulewidth{0pt}
% Lowercase headers
\renewcommand\chaptermark[1]{\markboth{#1}{}}
\renewcommand\sectionmark[1]{\markright{\thesection.\ #1}}

\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.

\global\let\@university\@empty
\global\let\@supervisors\@empty

\endinput