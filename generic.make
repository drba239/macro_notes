../report/%.csv.log: ../output/%.csv | ../report
ifneq ($(shell command -v md5),)
	cat <(md5 -r $<) <(echo -n 'Lines:') <(cat $< | wc -l | xargs) <(head -3 $<) <(echo '...') <(tail -2 $<)  > $@
else
	cat <(md5sum $< | sed 's/  / /') <(echo -n 'Lines:') <(cat $< | wc -l) <(head -3 $<) <(echo '...') <(tail -2 $<) > $@
endif
	cat $< | sed -e 's/\r//g' | sed -e :a -e 's/,"\([^"]*\),\([^"]*\)"/,"\1\2"/g; s/"\([^"]*\),\([^"]*\)",/"\1\2",/g; ta' | gawk -f ../../get_averages_csv.awk >> $@

../output ../temp ../input ../report slurmlogs:
	mkdir $@

input:
	mkdir $@

run.sbatch: ../../setup_environment/code/run.sbatch | slurmlogs
	ln -sf $< $@

../../%: #Generic recipe to produce outputs from upstream tasks
	$(MAKE) -C $(subst output/,code/,$(dir $@)) ../output/$(notdir $@)

../%: #Generic recipe to produce outputs from upstream tasks
	$(MAKE) -C $(subst output/,code/,$(dir $@)) ../output/$(notdir $@)

.PHONY: wipe

wipe:
	$(WIPE)