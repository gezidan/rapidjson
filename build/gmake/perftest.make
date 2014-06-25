# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug32
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug32)
  OBJDIR     = ../../intermediate/debug/gmake/perftest/x32
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/perftest_debug_x32_gmake
  DEFINES   += -DDEBUG
  INCLUDES  += -I../../include -I../../thirdparty/gtest/include -I../../thirdparty -I../../thirdparty/jsoncpp/include -I../../thirdparty/libjson -I../../thirdparty/yajl/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -Wall -g -m32 -msse4.2 -Werror=cast-qual
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m32 -L/usr/lib32 -L../../thirdparty/lib
  LIBS      += -lgtest_debug_x32_gmake
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../intermediate/release/gmake/perftest/x32
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/perftest_release_x32_gmake
  DEFINES   += -DNDEBUG
  INCLUDES  += -I../../include -I../../thirdparty/gtest/include -I../../thirdparty -I../../thirdparty/jsoncpp/include -I../../thirdparty/libjson -I../../thirdparty/yajl/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -Wall -O2 -m32 -msse4.2 -Werror=cast-qual
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -Wl,-x -m32 -L/usr/lib32 -L../../thirdparty/lib
  LIBS      += -lgtest_release_x32_gmake
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../intermediate/debug/gmake/perftest/x64
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/perftest_debug_x64_gmake
  DEFINES   += -DDEBUG
  INCLUDES  += -I../../include -I../../thirdparty/gtest/include -I../../thirdparty -I../../thirdparty/jsoncpp/include -I../../thirdparty/libjson -I../../thirdparty/yajl/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -Wall -g -m64 -msse4.2 -Werror=cast-qual
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -m64 -L/usr/lib64 -L../../thirdparty/lib
  LIBS      += -lgtest_debug_x64_gmake
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../intermediate/release/gmake/perftest/x64
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/perftest_release_x64_gmake
  DEFINES   += -DNDEBUG
  INCLUDES  += -I../../include -I../../thirdparty/gtest/include -I../../thirdparty -I../../thirdparty/jsoncpp/include -I../../thirdparty/libjson -I../../thirdparty/yajl/include
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -Wall -O2 -m64 -msse4.2 -Werror=cast-qual
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -Wl,-x -m64 -L/usr/lib64 -L../../thirdparty/lib
  LIBS      += -lgtest_release_x64_gmake
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../thirdparty/lib/libgtest_release_x64_gmake.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/jsoncpptest.o \
	$(OBJDIR)/misctest.o \
	$(OBJDIR)/perftest.o \
	$(OBJDIR)/platformtest.o \
	$(OBJDIR)/rapidjsontest.o \
	$(OBJDIR)/ultrajsontest.o \
	$(OBJDIR)/yajltest.o \
	$(OBJDIR)/yajl_all.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking perftest
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning perftest
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/jsoncpptest.o: ../../test/perftest/jsoncpptest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/misctest.o: ../../test/perftest/misctest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/perftest.o: ../../test/perftest/perftest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/platformtest.o: ../../test/perftest/platformtest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/rapidjsontest.o: ../../test/perftest/rapidjsontest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ultrajsontest.o: ../../test/perftest/ultrajsontest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/yajltest.o: ../../test/perftest/yajltest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/yajl_all.o: ../../test/perftest/yajl_all.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(CFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
