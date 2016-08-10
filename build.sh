#sudo apt-get install -y g++ python libusb-1.0-0-dev freeglut3-dev doxygen graphviz
#sudo apt-get install libudev-dev
if [ ! -d "OpenNI2" ]; then
	if [ -f preDownloadPackage/OpenNI2.tar.gz ]; then
		tar fvxz preDownloadPackage/OpenNI2.tar.gz -C ./
	else
		git clone https://github.com/occipital/OpenNI2.git
	fi	
fi
cd OpenNI2
patch -p1 < ../preDownloadPackage/OpenNI2_jetson_tk1.patch
make
make core_samples
GLUT_SUPPORTED=1 make tools
