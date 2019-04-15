\ProvidesClass{ncl-thesis}[2018/12/08 Class for thesis of Newcastle University (UK)]
\newif\ifnclthesis@print
\newif\ifnclthesis@draft
\newif\ifnclthesis@final
\DeclareOption{print}{\nclthesis@printtrue}
\DeclareOption{draft}{\nclthesis@drafttrue}
\DeclareOption{final}{\nclthesis@finaltrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

% Set global options
\ifnclthesis@draft
	\def\@classoptionslist{draft}
\fi
\ifnclthesis@final
	\def\@classoptionslist{final}
\fi

% Process draft and print options
\newif\ifnclthesis@doublespacing
\ifnclthesis@print
	\PassOptionsToClass{twoside}{book}
	\ifnclthesis@draft
		\nclthesis@doublespacingtrue
	\fi
\else
	\PassOptionsToClass{oneside}{book}
\fi
\ifnclthesis@draft
	\PassOptionsToPackage{backref=true}{biblatex}
\fi

% Use the book class
\LoadClass[
	12pt,
	a4paper,
	]{book}

\RequirePackage{etoolbox}
\RequirePackage{colors-ncl}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage[
	markifdraft,
	]{gitinfo2}
	\renewcommand{\gitMark}{\gitBranch\,@\,\gitAbbrevHash{} (\gitAuthorDate) \gitReln}
\PassOptionsToPackage{pdfusetitle}{hyperref}
\AtEndPreamble{%
	\RequirePackage{hyperref}
	% Draft watermark
	\ifnclthesis@draft
		\RequirePackage[firstpage]{draftwatermark}
		\SetWatermarkText{DRAFT}
		\SetWatermarkScale{1}
	\fi
}

% More sensible float placement
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}

\def\@university{\@empty}
\def\@supervisors{\@empty}
\newcommand{\university}[1]{\def\@university{#1}\global\let\university\@empty}
\newcommand{\supervisors}[1]{\def\@supervisors{#1}\global\let\supervisors\@empty}

\def\maketitle{%
	% Set hidelinks here in case link type was changed in main tex file
	\ifnclthesis@print
		\hypersetup{hidelinks}
	\fi
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
			\ifnclthesis@draft
				\color{red}Draft compiled \@date{}\par
			\else
				\@date\par
			\fi
			}
		\end{center}%
	\end{titlepage}
	%
	% use double line spacing if we're in draft mode and printing mode
	\ifnclthesis@doublespacing
		\doublespacing
	\else
		\onehalfspacing
	\fi
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
