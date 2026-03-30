/* Kernel 6.1 compatibility for mainline 6.7+ APIs */
#ifndef __AW88395_COMPAT_H
#define __AW88395_COMPAT_H

/* __free(kfree) cleanup not available in 6.1 — minor leak on error paths
 * in DSP firmware loading (not used by AW87390 Anbernic handler) */
#ifndef __free
#define __free(x)
#endif

#ifndef kzalloc_obj
#define kzalloc_obj(obj) kzalloc(sizeof(obj), GFP_KERNEL)
#endif

#ifndef crc32c
#define crc32c(seed, d, sz) crc32(seed, d, sz)
#endif

#endif
