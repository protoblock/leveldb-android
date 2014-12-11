NDK_HOME=~/android-ndk-r10d
NDK_BUILD=${NDK_HOME}/ndk-build APP_BUILD_SCRIPT=Android.mk NDK_APPLICATION_MK=Application.mk NDK_PROJECT_PATH=.

all: ./staticLibs/armeabi/libleveldb.a ./staticLibs/armeabi-v7a/libleveldb.a ./staticLibs/x86/libleveldb.a ./staticLibs/x86_64/libleveldb.a
		
./staticLibs/%/libleveldb.a: compile
	install -d "./staticLibs/${*}/"
	install ./obj/local/${*}/libleveldb.a ./staticLibs/${*}/


compile:
	${NDK_BUILD}



clean:
	rm -rf obj libs/*
