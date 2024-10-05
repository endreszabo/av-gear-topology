audio:
	dot -v -Tsvg -o output/audio.svg audio.dot
video:
	dot -Tps:cairo:cairo video.dot | ps2pdf - > output/video.pdf
#	dot -v -Tsvg -o output/video.svg video.dot
all: video audio
