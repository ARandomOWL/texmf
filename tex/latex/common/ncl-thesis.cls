\ProvidesClass{ncl-thesis}[2018/12/08 Class for thesis of Newcastle University (UK)]
\newif\ifnclthesis@print
\newif\ifnclthesis@draft
\newif\ifnclthesis@final
\newif\ifnclthesis@alwaysbackref
\newif\ifnclthesis@lineno
\DeclareOption{print}{\nclthesis@printtrue}
\DeclareOption{draft}{\nclthesis@drafttrue}
\DeclareOption{final}{\nclthesis@finaltrue}
\DeclareOption{alwaysbackref}{\nclthesis@alwaysbackreftrue}
\DeclareOption{lineno}{\nclthesis@linenotrue}
\DeclareOption{linenopagewise}{\PassOptionsToPackage{pagewise}{lineno}}
\DeclareOption{linenomodulo}{\PassOptionsToPackage{modulo}{lineno}}
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
	\PassOptionsToClass{switch}{lineno}
\else
	\PassOptionsToClass{oneside}{book}
\fi
\ifnclthesis@draft
	\PassOptionsToPackage{backref=true}{biblatex}
	\nclthesis@doublespacingtrue
\fi
\ifnclthesis@alwaysbackref
	\PassOptionsToPackage{backref=true}{biblatex}
\fi

% Use the book class
\LoadClass[
	12pt,
	a4paper,
	]{book}

% Margins using geometry
\ifnclthesis@print
	\RequirePackage[
		top=2cm,
		bottom=2cm,
		inner=3cm,
		outer=2cm,
		]{geometry}
\else
	\RequirePackage[
		top=2cm,
		bottom=2cm,
		left=2.5cm,% Equalise left and right so we get the same total horizontal margin as in print
		right=2.5cm,
		]{geometry}
\fi

% Define abstract environment, as it's not defined in book class
\newenvironment{abstract}{\chapter{Abstract}}

\RequirePackage{etoolbox}
\RequirePackage{colors-ncl}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}

\ifnclthesis@draft
\ifnclthesis@lineno
	\RequirePackage{lineno}
	\g@addto@macro\mainmatter{\linenumbers}
	\g@addto@macro\backmatter{\nolinenumbers}
	\AtBeginEnvironment{abstract}{\linenumbers}
	\AtEndEnvironment{abstract}{\nolinenumbers}
	\AtEndPreamble{%
		\AtBeginBibliography{\nolinenumbers}% Provided by biblatex, so must come after it's loaded
		% Bibliography forms a group, so turning lineno back on after is
		% not required. \AtEndBiblography does not exist anyway.
		% \AtEndBibliography{\linenumbers}%
	}

	\RequirePackage{amsmath}
	%% https://tex.stackexchange.com/a/461192 Automatic fix (without mathlines)
	%% Patch 'normal' math environments:
	\newcommand*\linenomathpatch[1]{%
	  \cspreto{#1}{\linenomath}%
	  \cspreto{#1*}{\linenomath}%
	  \cspreto{end#1}{\endlinenomath}%
	  \cspreto{end#1*}{\endlinenomath}%
	}
	\linenomathpatch{equation}
	\linenomathpatch{gather}
	\linenomathpatch{multline}
	\linenomathpatch{align}
	\linenomathpatch{alignat}
	\linenomathpatch{flalign}
\fi
\fi
\providecommand{\@LN}[2]{}% Prevent errors when recompiling after lineno is disabled

\RequirePackage[
	markifdraft,
	]{gitinfo2}
	\providecommand\gitrev{}% Holds a custom revision number
	\renewcommand{\gitMark}{\gitBranch\,@\,\gitAbbrevHash{} (\gitAuthorDate) \gitrev}
	\apptocmd\gitMarkFormat{\upshape\mdseries}{}{} % Fix: text is bold if bold text begins next page
\PassOptionsToPackage{pdfusetitle}{hyperref}
\PassOptionsToPackage{pdfa}{hyperref}% Make hyperref attempt to satisfy PDF/A
\AtEndPreamble{%
	\RequirePackage{hyperref}
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
	% use double line spacing if we're in draft mode
	\ifnclthesis@doublespacing
		\doublespacing
	\else
		\onehalfspacing
	\fi
}

% Header/footer styles using fancyhdr
\setlength{\headheight}{16pt}
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
