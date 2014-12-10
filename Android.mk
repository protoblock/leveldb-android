
# Copyright (c) 2011 The LevelDB Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file. See the AUTHORS file for names of contributors.

# INSTRUCTIONS
# After you've downloaded and installed the Android NDK from:
# http://developer.android.com/sdk/ndk/index.html
# 1. In the same directory as this file, Android.mk, type:
#    $ ln -s leveldb .$(LOCAL_PATH)/jni
#    (The Android NDK will only build native projects in 
#     subdirectories named "jni".)
# 2. $ cd ..
# 3. Execute ndk-build:
#    $ $(ANDROID_NDK_DIR)/ndk-build

LOCAL_PATH := jni



include $(CLEAR_VARS)



LOCAL_MODULE := leveldb
LOCAL_CFLAGS := -D_REENTRANT -DOS_ANDROID -DLEVELDB_PLATFORM_POSIX -DNDEBUG  -std=c++11  #-DSNAPPY
LOCAL_CPP_FEATURES += exceptions
LOCAL_CPP_EXTENSION := .cc
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/leveldb $(LOCAL_PATH)
LOCAL_SRC_FILES := $(LOCAL_PATH)/db/builder.cc $(LOCAL_PATH)/db/c.cc $(LOCAL_PATH)/db/db_impl.cc $(LOCAL_PATH)/db/db_iter.cc $(LOCAL_PATH)/db/dbformat.cc $(LOCAL_PATH)/db/dumpfile.cc $(LOCAL_PATH)/db/filename.cc $(LOCAL_PATH)/db/leveldb_main.cc $(LOCAL_PATH)/db/log_reader.cc $(LOCAL_PATH)/db/log_writer.cc $(LOCAL_PATH)/db/memtable.cc $(LOCAL_PATH)/db/repair.cc $(LOCAL_PATH)/db/table_cache.cc $(LOCAL_PATH)/db/version_edit.cc $(LOCAL_PATH)/db/version_set.cc $(LOCAL_PATH)/db/write_batch.cc $(LOCAL_PATH)/helpers/memenv/memenv.cc $(LOCAL_PATH)/port/port_posix.cc $(LOCAL_PATH)/table/block.cc $(LOCAL_PATH)/table/block_builder.cc $(LOCAL_PATH)/table/filter_block.cc $(LOCAL_PATH)/table/format.cc $(LOCAL_PATH)/table/iterator.cc $(LOCAL_PATH)/table/merger.cc $(LOCAL_PATH)/table/table.cc $(LOCAL_PATH)/table/table_builder.cc $(LOCAL_PATH)/table/two_level_iterator.cc $(LOCAL_PATH)/util/arena.cc $(LOCAL_PATH)/util/bloom.cc $(LOCAL_PATH)/util/cache.cc $(LOCAL_PATH)/util/coding.cc $(LOCAL_PATH)/util/comparator.cc $(LOCAL_PATH)/util/crc32c.cc $(LOCAL_PATH)/util/env.cc $(LOCAL_PATH)/util/env_posix.cc $(LOCAL_PATH)/util/filter_policy.cc $(LOCAL_PATH)/util/hash.cc $(LOCAL_PATH)/util/histogram.cc $(LOCAL_PATH)/util/logging.cc $(LOCAL_PATH)/util/options.cc $(LOCAL_PATH)/util/status.cc

include $(BUILD_SHARED_LIBRARY)
