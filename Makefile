PKG=xebaposter

all: doc test clean

doc:
	xelatex $(PKG)-doc
	xelatex $(PKG)-doc
	evince $(PKG)-doc.pdf &

test: poster.tex poster-fa.tex
	xelatex poster
	xelatex poster
	evince poster.pdf &
	xelatex poster-fa
	xelatex poster-fa
	evince poster-fa.pdf &

clean:
	-rm *.aux *.log *.toc *.idx *.hd *~ *.out

ctan: clean
	mkdir -p $(PKG)/doc $(PKG)/tex
	cp -v README        $(PKG)
	cp -v $(PKG).cls    $(PKG)/tex
	cp -rv images     	$(PKG)/doc
	cp -v $(PKG)-doc.{tex,pdf} poster{-fa,}.{tex,pdf} $(PKG)/doc
	zip -r $(PKG).zip $(PKG)
	mv -fv $(PKG).zip ..
	rm -rfv ../$(PKG)
	mv -fv $(PKG) ..
