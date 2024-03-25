/**
  * D header file for Hurd string.
  *
  * Copyright: Copyright © 2019, The D Language Foundation
  * License: <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
  * Authors: Ernesto Castellotti
  */
module core.sys.hurd.string;

public import core.stdc.string;
import core.sys.hurd.config;

version (Hurd):
    extern (C):
    nothrow:
    @nogc:

    static if (_GNU_SOURCE)
    {
        pure void* memmem(return scope const void* haystack, size_t haystacklen, scope const void* needle, size_t needlelen);
    }
