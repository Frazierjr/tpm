sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
sudo apt -y install dpkg-dev debhelper libssl-dev libtool net-tools \
libfuse-dev libglib2.0-dev libgmp-dev expect libtasn1-dev socat \
python3-twisted gnutls-dev gnutls-bin  libjson-glib-dev gawk git \
python3-setuptools softhsm2 libseccomp-dev automake autoconf libtool \
gcc build-essential libssl-dev dh-exec pkg-config dh-autoreconf


git clone https://github.com/stefanberger/libtpms.git
cd libtpms
./autogen.sh --with-openssl
make dist
dpkg-buildpackage -us -uc -j4
sudo apt install ../libtpms*.deb


git clone https://github.com/stefanberger/swtpm.git
cd swtpm
dpkg-buildpackage -us -uc -j4
sudo apt install ../swtpm*.deb
