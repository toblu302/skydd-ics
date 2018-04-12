#
#
#DEPENDENCIES = pandoc texlive
#depend:
#	sudo yum install $(DEPENDENCIES)

all: 96_refs.md pdf html epub docx

clean:
	@for i in bok.html bok.pdf bok.epub bok.docx; do \
		if [ -f $$i ];then \
			rm $$i; \
		fi \
	done
	@if [ -f 96_refs.md ];then \
		rm -f 96_refs.md; \
	fi

96_refs.md: 95_refs.md
	./scripts/gen_refs.pl

epub: 96_refs.md *.md
	pandoc *.md -o bok.epub -Vlof -V lang=swedish --chapters --table-of-contents 
# Should we have stylesheet on epub?
#--epub-stylesheet css/style.css

docx: 96_refs.md *.md
	pandoc *.md -o bok.docx -Vlof -V lang=swedish --chapters --table-of-contents 

pdf: 96_refs.md *.md
	pandoc *.md -o bok.pdf -Vlof -V lang=swedish --chapters --table-of-contents --template=default.latex

html: 96_refs.md *.md
	pandoc *.md -o bok.html -c css/style.css --table-of-contents -w html5 -Vlof -V lang=swedish 
	@sed -i.tmp '/googlecode.com/c\'$$'\n''<link rel=stylesheet href=css/ie9html5.js>\n' bok.html
	@rm bok.html.tmp
	@sed -i.tmp s/\ style=\"text-align\:\ left\;\"\//g bok.html
	@rm bok.html.tmp
	@sed -i.tmp 's/<col .*<thead>/<thead>/g' bok.html
	@rm bok.html.tmp
