DBNAME := $(shell getini database dbname)
DBUSER := $(shell getini database username)
DBPASS := $(shell getini database password)
MYSQL = mysql -u $(DBUSER) --password='$(DBPASS)'

ZF = ZendFramework-1.12.1
TAR = $(ZF)-minimal.tar.gz
LIB = $(ZF)-minimal/library/

all: zf load

zf: Zend/View.php

$(TAR): 
	wget https://packages.zendframework.com/releases/$(ZF)/$(TAR)

Zend/View.php: $(TAR)
	tar xvf $(TAR) $(LIB)
	mv $(LIB)/Zend .
	rm -rf $(ZF)-minimal

load:
	mysql -e "CREATE MY DATABASE IF NOT EXISTS $(DBNAME)"
	mysql $(DBNAME) < database.sql