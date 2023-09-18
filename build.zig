const std = @import("std");

const c_source_files = [_][]const u8{ "src/autofit/autofit.c", "src/base/ftbase.c", "src/base/ftbbox.c", "src/base/ftbdf.c", "src/base/ftbitmap.c", "src/base/ftcid.c", "src/base/ftfstype.c", "src/base/ftgasp.c", "src/base/ftglyph.c", "src/base/ftgxval.c", "src/base/ftinit.c", "src/base/ftmm.c", "src/base/ftotval.c", "src/base/ftpatent.c", "src/base/ftpfr.c", "src/base/ftstroke.c", "src/base/ftsynth.c", "src/base/fttype1.c", "src/base/ftwinfnt.c", "src/bdf/bdf.c", "src/bzip2/ftbzip2.c", "src/cache/ftcache.c", "src/cff/cff.c", "src/cid/type1cid.c", "src/gzip/ftgzip.c", "src/lzw/ftlzw.c", "src/pcf/pcf.c", "src/pfr/pfr.c", "src/psaux/psaux.c", "src/pshinter/pshinter.c", "src/psnames/psnames.c", "src/raster/raster.c", "src/sdf/sdf.c", "src/sfnt/sfnt.c", "src/smooth/smooth.c", "src/svg/svg.c", "src/truetype/truetype.c", "src/type1/type1.c", "src/type42/type42.c", "src/winfonts/winfnt.c" };
const windows_c_source_files = [_][]const u8{ "builds/windows/ftdebug.c", "builds/windows/ftsystem.c" };
const c_flags = [_][]const u8{};

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const lib = b.addStaticLibrary(.{
        .name = "freetype",
        .optimize = optimize,
        .target = target,
    });
    lib.linkLibC();
    lib.addIncludePath(.{ .path = "./include" });
    lib.addCSourceFiles(&c_source_files, &c_flags);

    lib.defineCMacro("FT_DISABLE_ZLIB", "TRUE");
    lib.defineCMacro("FT_DISABLE_PNG", "TRUE");
    lib.defineCMacro("FT_DISABLE_HARFBUZZ", "TRUE");
    lib.defineCMacro("FT_DISABLE_BZIP2", "TRUE");
    lib.defineCMacro("FT_DISABLE_BROTLI", "TRUE");

    lib.defineCMacro("FT2_BUILD_LIBRARY", "TRUE");

    const t = lib.target_info.target;
    switch (t.os.tag) {
        .windows => {
            lib.addCSourceFiles(&windows_c_source_files, &c_flags);
        },
        else => {},
    }

    b.installArtifact(lib);
}
