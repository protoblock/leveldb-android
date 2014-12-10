NDK_HOME=~/android-ndk-r10c
NDK_BUILD=${NDK_HOME}/ndk-build APP_BUILD_SCRIPT=Android.mk NDK_APPLICATION_MK=Application.mk NDK_PROJECT_PATH=.

all:
	${NDK_BUILD}

clean:
	rm -rf obj libs/*
