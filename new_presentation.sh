#!/bin/bash

FOLDER=${1:-NONE}
BASENAME=${2:-NONE}

function help() {
    echo ""
    echo "Dummy script to create new beamer presentations"
    echo "USAGE: $0 folder_name tex_base_name"
    echo ""
}

if [ "$FOLDER" == "NONE" ] || [ "$BASENAME" == "NONE" ]; then
    help
    exit
fi

echo "create new [$BASENAME.tex]  at [$FOLDER] folder"

if [[ -f "$FOLDER/$BASENAME.tex" ]]; then
    echo -e "\033[0;31m$FOLDER/$BASENAME.tex ALREADY EXISTS\033[0m"
fi


mkdir -p $FOLDER
mkdir -p $FOLDER/img

echo "\documentclass[12pt, aspectratio=169]{beamer} % aspectratio = either 43 or 169
\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\usepackage[T1]{fontenc}
\graphicspath{ {./img/} }

\usetheme{Hannover}
\mode<presentation>

% title and author
\title{Plantilla}
\author{Luis Palomero}
%\date{2021-04-23}
% document
\begin{document}


\frame{\titlepage}


\begin{frame}{Overview}
\tableofcontents
\end{frame}

\section{Plantilla}
\begin{frame}{La sección}{La idea}

Esto es una idea de plantilla.

\end{frame}

\begin{frame}{La sección}{La planta pequeña}

  Una planta pequeña es una plantilla.
  
\end{frame}


%\begin{frame}{La R-API}{Estructura y componentes}
%  \begin{figure}
%    \includegraphics[width=1\textwidth]{20210407_1_estructura_clases.png}
%    \label{fig:estructura_clases}
%  \end{figure}
%\end{frame}


\end{document}" > $FOLDER/$BASENAME.tex

git add $FOLDER/$BASENAME.tex

