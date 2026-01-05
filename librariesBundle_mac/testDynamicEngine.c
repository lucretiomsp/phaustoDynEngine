#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <unistd.h>

/* Forward declaration to match your API */
typedef struct dsp dsp;

typedef dsp* (*createDsp_fn)(
    const char* name_app,
    const char* dsp_content,
    int argc,
    const char* argv[],
    const char* target,
    int opt_level
);



int main(void)
{
    const char* lib_path = "./libdynamic-engine.dylib";

    printf("🔍 Loading %s\n", lib_path);
    void* handle = dlopen(lib_path, RTLD_NOW | RTLD_LOCAL);
    if (!handle) {
        fprintf(stderr, "❌ dlopen failed: %s\n", dlerror());
        return 1;
    }
    printf("✅ libdynamic-engine loaded\n");

    dlerror(); /* clear */
    createDsp_fn createDsp =
        (createDsp_fn)dlsym(handle, "createDsp");

    const char* err = dlerror();
    if (err) {
        fprintf(stderr, "❌ dlsym failed: %s\n", err);
        return 1;
    }
    printf("✅ createDsp symbol resolved\n");


if (access("faustLibs/all.lib", R_OK) != 0) {
    perror("❌ Faust cannot access faustLibs/all.lib");
    return 1;
}
printf("✅ faustLibs/all.lib is accessible\n");


    /* Faust DSP code */
    const char* dsp_code = "process = _;"


    /*
        "import(\"stdfaust.lib\");\n"
        "tempo = hslider(\"tempo\", 10000, 300, 20000, 100);\n"
        "freq = hslider(\"freq\", 300, 200, 900, 100);\n"
        "process = ba.pulsen(1, tempo) : "
        "pm.djembe(freq, 0.3, 0.4, 1) <: dm.freeverb_demo;";
*/
    /* Faust compiler arguments */
    const char* argv[] = {
        "-I", "librariesBundle/faustLibs"
    };
    int argc = 2;

    printf("🚀 Calling createDsp...\n");

    dsp* result = createDsp(
        "ci-test",
        dsp_code,
        argc,
        argv,
        "coreaudio",
        3
    );

    if (!result) {
        fprintf(stderr, "❌ createDsp returned NULL\n");
        return 1;
    }

    printf("🎉 DSP created successfully!\n");

    dlclose(handle);
    return 0;
}
