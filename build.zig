const std = @import("std");

pub fn build(b: *std.Build) void {
    std.debug.print("The files are: {}", "Teste");
    _ = b;
}