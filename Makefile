all:
	pandoc -t beamer -s vim.markdown --toc -V theme:Warsaw -o vim.pdf
