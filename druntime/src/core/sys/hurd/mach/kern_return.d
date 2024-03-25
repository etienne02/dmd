/**
 * D header file for Hurd.
 *
 * License:   $(HTTP www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Etienne Brateau
 */
module core.sys.darwin.mach.kern_return;

version (Hurd):
extern (C):

alias kern_return_t = int;

enum : kern_return_t
{
    KERN_SUCCESS                   = 0,
    KERN_INVALID_ADDRESS           = 1,   /// Specified address is not currently valid.
    KERN_PROTECTION_FAILURE        = 2,   /// Specified memory is valid, but does not permit the required form of access.
    KERN_NO_SPACE                  = 3,   /// The addres range specified is already in use, or no address range of the size specified could be found.
    KERN_INVALID_ARGUMENT          = 4,   /// The function requested was not applicable to this type of argument, or an argument
    KERN_FAILURE                   = 5,   /// The function could not be performed. A catch-all.
    KERN_RESOURCE_SHORTAGE         = 6,   /// A system resource could not be allocated to fulfill this request. This is a failure may not be permanent.
    KERN_NOT_RECEIVER              = 7,   /// The task in question does not hold receive rights for the port argument.
    KERN_NO_ACCESS                 = 8,   /// Bogus access restriction
    KERN_MEMORY_FAILURE            = 9,   /// During a page fault, the target address refers to a memory object that has been destroyed. This failure is permanent.
    KERN_MEMORY_ERROR              = 10,  /// During a page fault, the memory object indicated that the data could not be returned. This failure may be temporary; future attemts to access this same data may succeed, as defined by the memory object.
    KERN_ALREADY_IN_SET            = 11,  /// obsolete
    KERN_NOT_IN_SET                = 12,  /// The receive right is not a member of a port set.
    KERN_NAME_EXISTS               = 13,  /// The name already denotes a right in the task.
    KERN_ABORTED                   = 14,  /// The operation was aborted. Ips code will catch this and reflect it as a message error.
    KERN_INVALID_NAME              = 15,  /// The name doesn't denote a right in the task.
    KERN_INVALID_TASK              = 16,  /// Target task isn't an active task.
    KERN_INVALID_RIGHT             = 17,  /// The name denotes a right, but not an appropriate right.
    KERN_INVALID_VALUE             = 18,  /// A blatant range error.
    KERN_UREFS_OVERFLOW            = 19,  /// Operation would overflow limit on user-references.
    KERN_INVALID_CAPABILITY        = 20,  /// The supplied (port) capability is improper.
    KERN_RIGHT_EXISTS              = 21,  /// The task already has send or receive rights for the port under another name.
    KERN_INVALID_HOST              = 22,  /// Target host isn't actually a host
    KERN_MEMORY_PRESENT            = 23,  /// An attempt was made to supply "precious" data for memory that is already present in a memory object.
    KERN_WRITE_PROTECTION_FAILURE  = 24,  /// A page was marked as VM_PROT_NOTIFY and an attempt was made to write it
    KERN_TERMINATED                = 26,  /// Object has been terminated and is no longer available.
    KERN_TIMEOUT                   = 27,  /// Kernel operation timed out.
    KERN_INTERRUPTED               = 28,  /// Kernel operation was interrupted.
}
