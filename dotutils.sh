#!/bin/bash

new_dot_device() {
	devicename="$1"; shift
	devicelabel="$1"; shift
	deviceindex="$1"; shift

	echo "subgraph cluster_${devicename}_${deviceindex} {"
	echo "    label = \"${devicelabel} ${deviceindex}\";"
	for port in "$@"; do
		label="${port//_/ }"
		echo "    \"${devicename}_${deviceindex}_${port}\" [label=\"${label^^}\"];"
	done
	echo "}"
}

new_bmd_atem() {
	new_dot_device bmd_atem "BMD ATEM" "$1" hdmi_in_{1,2,3,4} hdmi_out;
}

new_bmd_videohub() {
	new_dot_device bmd_videohub "BMD VideoHub" "$1" sdi_in_{1,2,3,4,5,6,7,8,9,10,11,12} sdi_out_{1,2,3,4,5,6,7,8,9,10,11,12}
}

new_hdmi_splitter() {
	new_dot_device hdmi_splitter "HDMI Splitter" "$1" hdmi_in hdmi_out_{1,2}
}

new_bmd_bidi_converter() {
	new_dot_device bmd_bidi_converter "BMD BiDi Converter" "$1" {hdmi,sdi}_{in,out}
}

new_bmd_sdi2hdmi_converter() {
	new_dot_device bmd_sdi2hdmi_converter "BMD SDI->HDMI Converter" "$1" hdmi_out sdi_in sdi_thru
}

new_bmd_hdmi2sdi_converter() {
	new_dot_device bmd_hdmi2sdi_converter "BMD HDMI->SDI Converter" "$1" hdmi_in sdi_out_{1,2}
}

