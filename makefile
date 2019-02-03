
MODAL=tin/modal_common.tin \
	  tin/modal_cleric.tin \
	  tin/modal_mage.tin

all: mapper

mapper: 
	git clone https://github.com/nstockton/mapperproxy-mume.git $@
	ln -sf $@/cacert.pem ./cacert.pem
	ln -sf $@/data ./data

modal: $(MODAL)

tin/modal_common.tin: tin/alias_common.tin
	python modalizer.py $^ > $@

tin/modal_cleric.tin: tin/alias_common.tin tin/alias_cleric.tin
	python modalizer.py $^ > $@

tin/modal_mage.tin: tin/alias_common.tin tin/alias_mage.tin
	python modalizer.py $^ > $@

clean:
	rm -f $(MODAL)
