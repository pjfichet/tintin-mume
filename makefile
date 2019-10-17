
MODAL=tin/modal_common.tin \
	  tin/modal_cleric.tin \
	  tin/modal_mage.tin \
	  tin/modal_warrior.tin

all: mapper

mapper: 
	git clone https://github.com/nstockton/mapperproxy-mume.git $@
	ln -sf $@/cacert.pem ./cacert.pem
	ln -sf $@/data ./data

modal: $(MODAL)

tin/modal_%.tin:
	python modalizer.py $^ > $@

tin/modal_common.tin: tin/alias_common.tin
tin/modal_cleric.tin: tin/alias_common.tin tin/alias_cleric.tin
tin/modal_mage.tin: tin/alias_common.tin tin/alias_mage.tin
tin/modal_warrior.tin: tin/alias_common.tin tin/alias_warrior.tin

clean:
	rm -f $(MODAL)
