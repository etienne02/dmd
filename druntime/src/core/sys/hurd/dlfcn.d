/**
 * D header file for GNU/Hurd
 *
 * $(LINK2 http://sourceware.org/git/?p=glibc.git;a=blob;f=dlfcn/dlfcn.h, glibc dlfcn/dlfcn.h)
 */
module core.sys.hurd.dlfcn;

version (Hurd):
extern (C):
nothrow:
@nogc:
@system:

public import core.sys.posix.dlfcn;
import core.sys.hurd.config;

static if (_GNU_SOURCE)
{
    enum RTLD_NEXT = cast(void *)-1L;
    enum RTLD_DEFAULT = cast(void *)0;
    alias c_long Lmid_t;
    enum LM_ID_BASE = 0;
    enum LM_ID_NEWLM = -1;
}

// void* dlopen(const scope char* __file, int __mode); // POSIX
// int dlclose(void* __handle); // POSIX
// void* dlsym(void* __handle, const scope char* __name); // POSIX

static if (_GNU_SOURCE)
{
    void* dlmopen(Lmid_t __nsid, const scope char* __file, int __mode);
    void* dlvsym(void* __handle, const scope char* __name, const scope char* __version);
}

// char* dlerror(); // POSIX

static if (_GNU_SOURCE)
{
    int dladdr1(void* __address, Dl_info* __info, void** __extra_info, int __flags);

    enum
    {
        RTLD_DL_SYMENT = 1,
        RTLD_DL_LINKMAP = 2,
    }

    int dlinfo(void* __handle, int __request, void* __arg);

    enum
    {
        RTLD_DI_LMID = 1,
        RTLD_DI_LINKMAP = 2,
        RTLD_DI_CONFIGADDR = 3,
        RTLD_DI_SERINFO = 4,
        RTLD_DI_SERINFOSIZE = 5,
        RTLD_DI_ORIGIN = 6,
        RTLD_DI_PROFILENAME = 7,
        RTLD_DI_PROFILEOUT = 8,
        RTLD_DI_TLS_MODID = 9,
        RTLD_DI_TLS_DATA = 10,
        RTLD_DI_MAX = 10,
    }

    struct Dl_serpath
    {
        char* dls_name;
        uint dls_flags;
    }

    struct Dl_serinfo
    {
        size_t dls_size;
        uint dls_cnt;
        Dl_serpath[1] dls_serpath;
    }
}

// http://sourceware.org/git/?p=glibc.git;a=blob;f=bits/dlfcn.h
static if (_GNU_SOURCE)
{
    RT DL_CALL_FCT(RT, Args...)(RT function(Args) fctp, auto ref Args args)
    {
        _dl_mcount_wrapper_check(cast(void*)fctp);
        return fctp(args);
    }

    void _dl_mcount_wrapper_check(void* __selfpc);
}
