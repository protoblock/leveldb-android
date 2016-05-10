#!/bin/bash


PREFIX=$HOME/bin/leveldb/android/

if [ -d $PREFIX ];
	then 
	rm -rf ${PREFIX}
	mkdir -p ${PREFIX}/lib
	mkdir -p ${PREFIX}/include
else 
	mkdir -p ${PREFIX}/lib
	mkdir -p ${PREFIX}/include/leveldb/
fi 

if [ -d $HOME/Desktop/ndk/android-ndk-r11c ];
	then
		echo "Already have the right version of ndk";
	else
		echo "Downloading the correct NDK toolkit";
		mkdir -p $HOME/Desktop/ndk/
		cd $HOME/Desktop/ndk/
		wget http://dl.google.com/android/repository/android-ndk-r11c-darwin-x86_64.zip
		bzip2 -d android-ndk-r11c-darwin-x86.tar.bz2
		tar -xf android-ndk-r11c-darwin-x86.tar
		## clean up
		## rm android-ndk-r11c-darwin-x86.tar
		## rm android-ndk-r11c-darwin-x86.tar.bz2
	fi


NDK_ROOT=$HOME/Desktop/ndk/android-ndk-r11c
export ANDROID_NDK_ROOT=$NDK_ROOT
export PATH=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/:$PATH
export SYSROOT=$NDK_ROOT/platforms/android-24/arch-arm/
export CC="arm-linux-androideabi-gcc --sysroot $SYSROOT"
export CXX="arm-linux-androideabi-g++ --sysroot $SYSROOT"
export CXXSTL=$NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/



##########################################
# Download leveldb for android
##########################################

cd /tmp 

if [ -d /tmp/leveldb-android ];
then
    rm -rf /tmp/leveldb-android
fi

git clone https://github.com/protoblock/leveldb-android.git
cd leveldb-android/
git submodule update --recursive
git clone https://github.com/google/leveldb.git

export NDK_PROJECT_PATH=/tmp/leveldb-android/leveldb



$NDK_ROOT/ndk-build 

#cp -r /tmp/leveldb-android/libs/ ${PREFIX}/lib
#cp -r /tmp/leveldb-android/include ${PREFIX}/include

