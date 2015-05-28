# Copyright (c) 2012-2015 Mocana
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	mksquashfs.c \
	read_fs.c \
	action.c \
	swap.c \
	pseudo.c \
	sort.c \
	compressor.c \
	progressbar.c \
	read_file.c \
	info.c \
	restore.c \
	process_fragments.c \
	caches-queues-lists.c \
	gzip_wrapper.c \
	xz_wrapper.c \
	xattr.c \
	read_xattrs.c

#	lzma_wrapper.c 
#	lzma_xz_wrapper.c 
#	lzo_wrapper.c 

LOCAL_CFLAGS += -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -DCOMP_DEFAULT=\"gzip\" -Wall \
 -DGZIP_SUPPORT -DXZ_SUPPORT \
 -DXATTR_SUPPORT -DXATTR_DEFAULT \
 -Iexternal/xzlib/src/liblzma/api -I/usr/include

# -DLZMA_SUPPORT -DLZMA_XZ_SUPPORT -DLZO_SUPPORT 

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES += libselinux

LOCAL_SHARED_LIBRARIES := libz-host liblzma-host

LOCAL_LDLIBS += -lpthread -lm 
# -llzo2

LOCAL_MODULE := mksquash
LOCAL_MODULE_TAGS := eng

include $(BUILD_HOST_EXECUTABLE)
