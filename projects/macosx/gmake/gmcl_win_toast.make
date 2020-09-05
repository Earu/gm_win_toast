# GNU Make project makefile autogenerated by Premake

ifndef config
  config=releasewithsymbols_x86_64
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),releasewithsymbols_x86_64)
  ifeq ($(origin CC), default)
    CC = clang
  endif
  ifeq ($(origin CXX), default)
    CXX = clang++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  TARGETDIR = x86_64/ReleaseWithSymbols
  TARGET = $(TARGETDIR)/gmcl_win_toast_osx64.dll
  OBJDIR = x86_64/ReleaseWithSymbols/intermediate/gmcl_win_toast
  DEFINES += -DGMOD_ALLOW_OLD_TYPES -DGMOD_ALLOW_LIGHTUSERDATA -DNDEBUG -DGMMODULE -DWIN_TOAST_CLIENT -DIS_SERVERSIDE=false
  INCLUDES += -I../../../source -I../../../include -isystem ../../../../garrysmod_common/include -isystem ../../../../garrysmod_common/helpers/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -std=gnu++17 -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../../garrysmod_common/projects/macosx/gmake/x86_64/ReleaseWithSymbols/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86_64/ReleaseWithSymbols/liblua_shared.a
  LDDEPS += ../../../../garrysmod_common/projects/macosx/gmake/x86_64/ReleaseWithSymbols/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86_64/ReleaseWithSymbols/liblua_shared.a
  ALL_LDFLAGS += $(LDFLAGS) -m64 -dynamiclib -Wl,-install_name,@rpath/gmcl_win_toast_osx64.dll -mmacosx-version-min=10.7 -stdlib=libc++
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),releasewithsymbols_x86)
  ifeq ($(origin CC), default)
    CC = clang
  endif
  ifeq ($(origin CXX), default)
    CXX = clang++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  TARGETDIR = x86/ReleaseWithSymbols
  TARGET = $(TARGETDIR)/gmcl_win_toast_osx.dll
  OBJDIR = x86/ReleaseWithSymbols/intermediate/gmcl_win_toast
  DEFINES += -DGMOD_ALLOW_OLD_TYPES -DGMOD_ALLOW_LIGHTUSERDATA -DNDEBUG -DGMMODULE -DWIN_TOAST_CLIENT -DIS_SERVERSIDE=false
  INCLUDES += -I../../../source -I../../../include -isystem ../../../../garrysmod_common/include -isystem ../../../../garrysmod_common/helpers/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -std=gnu++17 -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../../garrysmod_common/projects/macosx/gmake/x86/ReleaseWithSymbols/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86/ReleaseWithSymbols/liblua_shared.a
  LDDEPS += ../../../../garrysmod_common/projects/macosx/gmake/x86/ReleaseWithSymbols/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86/ReleaseWithSymbols/liblua_shared.a
  ALL_LDFLAGS += $(LDFLAGS) -m32 -dynamiclib -Wl,-install_name,@rpath/gmcl_win_toast_osx.dll -mmacosx-version-min=10.7 -stdlib=libc++
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x86_64)
  ifeq ($(origin CC), default)
    CC = clang
  endif
  ifeq ($(origin CXX), default)
    CXX = clang++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  TARGETDIR = x86_64/Release
  TARGET = $(TARGETDIR)/gmcl_win_toast_osx64.dll
  OBJDIR = x86_64/Release/intermediate/gmcl_win_toast
  DEFINES += -DGMOD_ALLOW_OLD_TYPES -DGMOD_ALLOW_LIGHTUSERDATA -DNDEBUG -DGMMODULE -DWIN_TOAST_CLIENT -DIS_SERVERSIDE=false
  INCLUDES += -I../../../source -I../../../include -isystem ../../../../garrysmod_common/include -isystem ../../../../garrysmod_common/helpers/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -Wshadow -Wundef -flto -O3 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -msse2 -Wall -Wextra -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -Wshadow -Wundef -flto -O3 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -msse2 -Wall -Wextra -std=gnu++17 -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Release/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Release/liblua_shared.a
  LDDEPS += ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Release/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Release/liblua_shared.a
  ALL_LDFLAGS += $(LDFLAGS) -m64 -flto -dynamiclib -Wl,-install_name,@rpath/gmcl_win_toast_osx64.dll -mmacosx-version-min=10.7 -stdlib=libc++
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x86)
  ifeq ($(origin CC), default)
    CC = clang
  endif
  ifeq ($(origin CXX), default)
    CXX = clang++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  TARGETDIR = x86/Release
  TARGET = $(TARGETDIR)/gmcl_win_toast_osx.dll
  OBJDIR = x86/Release/intermediate/gmcl_win_toast
  DEFINES += -DGMOD_ALLOW_OLD_TYPES -DGMOD_ALLOW_LIGHTUSERDATA -DNDEBUG -DGMMODULE -DWIN_TOAST_CLIENT -DIS_SERVERSIDE=false
  INCLUDES += -I../../../source -I../../../include -isystem ../../../../garrysmod_common/include -isystem ../../../../garrysmod_common/helpers/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -flto -O3 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -msse2 -Wall -Wextra -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -flto -O3 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -msse2 -Wall -Wextra -std=gnu++17 -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../../garrysmod_common/projects/macosx/gmake/x86/Release/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86/Release/liblua_shared.a
  LDDEPS += ../../../../garrysmod_common/projects/macosx/gmake/x86/Release/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86/Release/liblua_shared.a
  ALL_LDFLAGS += $(LDFLAGS) -m32 -flto -dynamiclib -Wl,-install_name,@rpath/gmcl_win_toast_osx.dll -mmacosx-version-min=10.7 -stdlib=libc++
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x86_64)
  ifeq ($(origin CC), default)
    CC = clang
  endif
  ifeq ($(origin CXX), default)
    CXX = clang++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  TARGETDIR = x86_64/Debug
  TARGET = $(TARGETDIR)/gmcl_win_toast_osx64.dll
  OBJDIR = x86_64/Debug/intermediate/gmcl_win_toast
  DEFINES += -DGMOD_ALLOW_OLD_TYPES -DGMOD_ALLOW_LIGHTUSERDATA -DDEBUG -D_DEBUG -DGMMODULE -DWIN_TOAST_CLIENT -DIS_SERVERSIDE=false
  INCLUDES += -I../../../source -I../../../include -isystem ../../../../garrysmod_common/include -isystem ../../../../garrysmod_common/helpers/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -std=gnu++17 -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Debug/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Debug/liblua_shared.a
  LDDEPS += ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Debug/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86_64/Debug/liblua_shared.a
  ALL_LDFLAGS += $(LDFLAGS) -m64 -dynamiclib -Wl,-install_name,@rpath/gmcl_win_toast_osx64.dll -mmacosx-version-min=10.7 -stdlib=libc++
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x86)
  ifeq ($(origin CC), default)
    CC = clang
  endif
  ifeq ($(origin CXX), default)
    CXX = clang++
  endif
  ifeq ($(origin AR), default)
    AR = ar
  endif
  TARGETDIR = x86/Debug
  TARGET = $(TARGETDIR)/gmcl_win_toast_osx.dll
  OBJDIR = x86/Debug/intermediate/gmcl_win_toast
  DEFINES += -DGMOD_ALLOW_OLD_TYPES -DGMOD_ALLOW_LIGHTUSERDATA -DDEBUG -D_DEBUG -DGMMODULE -DWIN_TOAST_CLIENT -DIS_SERVERSIDE=false
  INCLUDES += -I../../../source -I../../../include -isystem ../../../../garrysmod_common/include -isystem ../../../../garrysmod_common/helpers/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -O0 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -std=gnu++17 -mmacosx-version-min=10.7 -stdlib=libc++
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../../garrysmod_common/projects/macosx/gmake/x86/Debug/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86/Debug/liblua_shared.a
  LDDEPS += ../../../../garrysmod_common/projects/macosx/gmake/x86/Debug/libhelpers.a ../../../../garrysmod_common/projects/macosx/gmake/x86/Debug/liblua_shared.a
  ALL_LDFLAGS += $(LDFLAGS) -m32 -dynamiclib -Wl,-install_name,@rpath/gmcl_win_toast_osx.dll -mmacosx-version-min=10.7 -stdlib=libc++
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/main.o \
	$(OBJDIR)/wintoastlib.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES) | $(TARGETDIR)
	@echo Linking gmcl_win_toast
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(CUSTOMFILES): | $(OBJDIR)

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
	@echo Cleaning gmcl_win_toast
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
$(OBJECTS): $(GCH) $(PCH) | $(OBJDIR)
$(GCH): $(PCH) | $(OBJDIR)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
else
$(OBJECTS): | $(OBJDIR)
endif

$(OBJDIR)/main.o: ../../../source/main.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wintoastlib.o: ../../../include/wintoastlib.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif