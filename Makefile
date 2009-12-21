SSNRCD  = $(HOME)/Projects/14496-5/x86/mpeg4audio/bin/conf_ssnrcd/Linux_gcc_O0d/ssnrcd
REFDEC  = $(HOME)/Projects/14496-5/x86/mpeg4audio/bin/mp4mcDec/Linux_isomp4_AFsp_gcc_O0d/mp4audec_mc
PNSCONF = $(HOME)/Projects/14496-5/x86/mpeg4audio/bin/conf_pns/Linux_gcc_O0d/pnsConformance
CONFVEC = $(HOME)/Projects/14496-4/
FFMPEG  = $(HOME)/Projects/ffmpeg/ffmpeg/ffmpeg
DELAY   = 1024s
SOX     = sox


m2_al00 = \
al00_08 al00_11 al00_12 al00_16 al00_22 al00_24 al00_32 al00_44 al00_48 al00_64 al00_88 al00_96
m2_al01 = \
al01_08 al01_11 al01_12 al01_16 al01_22 al01_24 al01_32 al01_44 al01_48 al01_64 al01_88 al01_96
m2_al02 = \
al02_08 al02_11 al02_12 al02_16 al02_22 al02_24 al02_32 al02_44 al02_48 al02_64 al02_88 al02_96
m2_al03 = \
al03_08 al03_11 al03_12 al03_16 al03_22 al03_24 al03_32 al03_44 al03_48 al03_64 al03_88 al03_96
m2_al04 = \
al04_08 al04_11 al04_12 al04_16 al04_22 al04_24 al04_32 al04_44 al04_48 al04_64 al04_88 al04_96
m2_al05 = \
al05_08 al05_11 al05_12 al05_16 al05_22 al05_24 al05_32 al05_44 al05_48 al05_64 al05_88 al05_96
m2_al06 = \
al06_08 al06_11 al06_12 al06_16 al06_22 al06_24 al06_32 al06_44 al06_48 al06_64 al06_88 al06_96
m2_al07 = \
al07_08 al07_11 al07_12 al07_16 al07_22 al07_24 al07_32 al07_44 al07_48 al07_64 al07_88 al07_96
m2_al14 = \
al14_08 al14_11 al14_12 al14_16 al14_22 al14_24 al14_32 al14_44 al14_48 al14_64 al14_88 al14_96
m2_al15 = \
$(m2_al00:al00%=al15%)
m2_al17 = \
al17_08 al17_11 al17_12 al17_16 al17_22 al17_24 al17_32 al17_44 al17_48 al17_64 al17_88 al17_96
sbr_cm_stereo = \
al_sbr_cm_48_1 al_sbr_cm_48_2
sbr_cm_mc = \
al_sbr_cm_48_4 al_sbr_cm_48_5.1 al_sbr_cm_48_5 al_sbr_cm_96_5 
sbr_e = \
al_sbr_e_32_1 al_sbr_e_32_2 al_sbr_e_44_1 al_sbr_e_44_2 al_sbr_e_48_1 al_sbr_e_48_2
sbr_gh = \
al_sbr_gh_32_1 al_sbr_gh_32_2 al_sbr_gh_44_1 al_sbr_gh_44_2 al_sbr_gh_48_1 al_sbr_gh_48_2
sbr_i_new = \
al_sbr_i_32_1_new al_sbr_i_32_2 al_sbr_i_44_1_new al_sbr_i_44_2 al_sbr_i_48_1_new al_sbr_i_48_2
sbr_ps_new = \
al_sbr_ps_00_new al_sbr_ps_01_new al_sbr_ps_02_new al_sbr_ps_03_new al_sbr_ps_04_new al_sbr_ps_05_new al_sbr_ps_06_new
sbr_qmf = \
al_sbr_qmf_32_1 al_sbr_qmf_44_1 al_sbr_qmf_48_1
sbr_s = \
al_sbr_s_32_1 al_sbr_s_32_2 al_sbr_s_44_1 al_sbr_s_44_2 al_sbr_s_48_1 al_sbr_s_48_2
sbr_sig02 = \
al_sbr_sig_48_2_sig0 al_sbr_sig_48_2_sig2
sbr_sig1 = \
al_sbr_sig_24_2_fsaac24_sig1 al_sbr_sig_48_2_sig1 
sbr_sr = \
al_sbr_sr_16_2_fsaac08 al_sbr_sr_16_2_fsaac16 al_sbr_sr_22_2_fsaac11 al_sbr_sr_22_2_fsaac22 al_sbr_sr_24_2_fsaac12 al_sbr_sr_24_2_fsaac24 al_sbr_sr_32_2_fsaac16 al_sbr_sr_32_2_fsaac32 al_sbr_sr_44_2_fsaac22 al_sbr_sr_44_2_fsaac44 al_sbr_sr_48_2_fsaac24 al_sbr_sr_48_2_fsaac48 al_sbr_sr_64_2_fsaac32 al_sbr_sr_88_2_fsaac44 al_sbr_sr_96_2_fsaac48
sbr_twi = \
al_sbr_twi_22_1_fsaac22 al_sbr_twi_48_1_fsaac24
m4_al18 = \
al18_08 al18_11 al18_12 al18_16 al18_22 al18_24 al18_32 al18_44 al18_48 al18_64 al18_88 al18_96
m4_al19 = \
al19_08 al19_11 al19_12 al19_16 al19_22 al19_24 al19_32 al19_44 al19_48 al19_64 al19_88 al19_96

m2_stereo = \
$(m2_al00) $(m2_al01) $(m2_al02) $(m2_al04) $(m2_al05) $(m2_al14) $(m2_al17)

m2_mc = \
$(m2_al06) $(m2_al07) $(m2_al15)

m2_sbr_stereo = \
$(sbr_cm_stereo) $(sbr_e) $(sbr_gh) $(sbr_i_new) $(sbr_ps_new) $(sbr_qmf) $(sbr_s) $(sbr_sig02) $(sbr_sr) $(sbr_twi)

m2_sbr_stereo_fail = \
$(sbr_sig1)

m2_sbr_mc = \
$(sbr_cm_mc)

m2_am00 = \
am00_08 am00_11 am00_12 am00_16 am00_22 am00_24 am00_32 am00_44 am00_48 am00_64 am00_88 am00_96
m2_am01 = $(m2_am00:am00%=am01%)
m2_am02 = $(m2_am00:am00%=am02%)
m2_am04 = $(m2_am00:am00%=am04%)
m2_am05 = $(m2_am00:am00%=am05%)
m2_am06 = $(m2_am00:am00%=am06%)
m2_am07 = $(m2_am00:am00%=am07%)

m2_main = $(m2_am00) $(m2_am01) $(m2_am02) $(m2_am04)

m2_adts_al09 = \
al09_08 al09_11 al09_12 al09_16 al09_22 al09_24 al09_32 al09_44 al09_48 al09_64 al09_88 al09_96

m2_adts_al12 = \
al12_48

m2_adts_al13 = \
al13_48

m2_adts = \
$(m2_adts_al09) $(m2_adts_al12) $(m2_adts_al13)

test_m2_stereo: $(m2_stereo)
test_m2_mc: $(m2_mc)
test_pns: $(m4_al18) $(m4_al19)

test_m2_sbr_stereo: $(m2_sbr_stereo)
test_m2_sbr_mc: $(m2_sbr_mc)

test_m2_main: $(m2_main)
test_m2_main_mc: $(m2_am05)

test_m2_adts: $(m2_adts)

test_all: test_m2_stereo test_m2_mc test_pns test_m2_sbr_stereo test_m2_sbr_mc test_m2_main test_m2_main_mc test_m2_adts

#Mono and Stereo non-PNS targets
$(m2_stereo) $(m2_sbr_stereo) $(m2_main) : %:
	@rm -f *.wav
	@echo "Conformance Vector $@"
	@$(REFDEC) $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ref.wav
	@$(SOX) ref.wav ref2.wav trim $(DELAY)
	@$(FFMPEG) -i $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ff.wav
	@$(SSNRCD) -t 7 -k 15 ref2.wav ff.wav

$(m2_mc) $(m2_sbr_mc) $(m2_am05): %:
	@rm -f *.wav
	@echo "Conformance Vector $@"
	@$(REFDEC) $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ref.wav
	@bash -c "shopt -s nullglob && $(SOX) -M ref_f*.wav ref_s*.wav ref_l*.wav ref_b*.wav ref2.wav trim $(DELAY)"
	@$(FFMPEG) -i $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ff.wav
	@$(SSNRCD) -t 7 -k 15 ref2.wav ff.wav

$(m2_adts): al%:
	@rm -f *.wav
	@echo "Conformance Vector $@"
	@$(REFDEC) $(CONFVEC)/mpeg2aac-conformance/compressedAdts/$@.adts ref.wav
	@$(SOX) ref.wav ref2.wav trim $(DELAY)
	@$(FFMPEG) -i $(CONFVEC)/mpeg2aac-conformance/compressedAdts/$@.adts ff.wav
	@$(SSNRCD) -t 7 -k 15 ref2.wav ff.wav

#PNS-1
$(m4_al18): al%:
	@rm -f *.wav
	@echo "Conformance Vector $@"
	@$(REFDEC) $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ref.wav
	@$(SOX) ref.wav ref2.wav trim $(DELAY)
	@$(FFMPEG) -i $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ff.wav
	@$(PNSCONF) ref2.wav ff.wav 1

#PNS-2/3
$(m4_al19): al%:
	@rm -f *.wav
	@echo "Conformance Vector $@"
	@$(REFDEC) $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ref.wav
	@$(SOX) ref.wav ref2.wav trim $(DELAY)
	@$(FFMPEG) -i $(CONFVEC)/mpeg4audio-conformance/compressedMp4/$@.mp4 ff.wav
	@$(PNSCONF) ref2.wav ff.wav 2 3

fmc_%:
	@rm -f *.wav
	@echo "Conformance Vector $@"
	@$(REFDEC) $(CONFVEC)/$* ref.wav
	@bash -c "shopt -s nullglob && $(SOX) -M ref_f*.wav ref_s*.wav ref_l*.wav ref_b*.wav ref2.wav trim $(DELAY)"
	@$(FFMPEG) -i $* ff.wav
	@$(SSNRCD) -t 7 -k 15 ref2.wav ff.wav

fst_%:
	@rm -f *.wav
	@echo "Conformance Vector $@"
	@$(REFDEC) $(CONFVEC)/$* ref.wav
	@$(SOX) ref.wav ref2.wav trim $(DELAY)
	@$(FFMPEG) -i $* ff.wav
	@$(SSNRCD) -t 7 -k 15 ref2.wav ff.wav

clean:
	@rm -f *.wav
