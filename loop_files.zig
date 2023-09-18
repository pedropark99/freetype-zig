const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const dir_path = "./src";
    var cwd = try std.fs.cwd().openIterableDir(dir_path, .{});
    defer cwd.close();
    var cwd_it = cwd.walk(allocator);
    while (cwd_it.next()) |file| {
        try stdout.print("Hello, {}!\n", .{file});
    }
}
