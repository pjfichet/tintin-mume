
MODAL=tin/modal_common.tin \
	  tin/modal_cleric.tin \
	  tin/modal_mage.tin

all: mapperproxy

mapperproxy-mume:
	git clone https://github.com/nstockton/mapperproxy-mume.git

mapperproxy: mapperproxy-mume
	ln -s mapperproxy-mume mapperproxy

modal: $(MODAL)

tin/modal_common.tin: tin/alias_common.tin
	python modalizer.py $^ > $@

tin/modal_cleric.tin: tin/alias_common.tin tin/alias_cleric.tin
	python modalizer.py $^ > $@

tin/modal_mage.tin: tin/alias_common.tin tin/alias_mage.tin
	python modalizer.py $^ > $@

clean:
	rm -f $(MODAL)
