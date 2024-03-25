/**
 * D header file for Hurd.
 *
 * License:   $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Etienne Brateau
 */
module core.sys.hurd.mach.port;

version (Hurd):
extern (C):

alias mach_port_name_t = uint;
alias mach_port_name_array_t = mach_port_name_t*;
alias const_mach_port_name_array_t = const mach_port_name_array_t;

alias mach_port_t = mach_port_name_t;
alias mach_port_array_t = mach_port_t*;
alias const_mach_port_array_t = const mach_port_array_t;

alias natural_t = uint;
alias mach_port_right_t = natural_t;
alias mach_port_right_type_t = natural_t;
