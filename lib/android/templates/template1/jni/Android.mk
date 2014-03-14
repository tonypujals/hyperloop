# Copyright (C) 2009 The Android Open Source Project
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
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := <%- MainActivityName %>
#LOCAL_SRC_FILES := TestAPI_JNI.c testapi.c
LOCAL_SRC_FILES := TestAPI_JNI.c \
	HyperloopJNI.c \
	HyperloopJNIExport.c \
	JS_android_util_Log.c \
	JS_java_lang_Object.c \
	JS_java_lang_String.c \
	JS_android_os_Bundle.c \
	JS_android_app_Activity.c \
	testapi.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../../API/ 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../../../../WTF/

LOCAL_CFLAGS := -std=c99

#LOCAL_SHARED_LIBRARIES := ALmixer_shared openal_shared
#LOCAL_SHARED_LIBRARIES := openal_shared
LOCAL_SHARED_LIBRARIES := JavaScriptCore_shared
LOCAL_LDLIBS    := -llog -landroid



include $(BUILD_SHARED_LIBRARY)

# Remember: The NDK_MODULE_PATH environmental variable must contain the modules directories in the search path.
# android build system will look for folder `ALmixer` and `openal`
# in all import paths:
#$(call import-module,ALmixer)
#$(call import-module,openal-soft)
$(call import-module,JavaScriptCore)

