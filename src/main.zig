const std = @import("std");
const zignvim = @import("zignvim");
const msgpack = @import("msgpack");

const Message = struct {
    name: []const u8,
    age: u8,
};

pub fn main() !void {
    // Prints to stderr, ignoring potential errors.
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
    try zignvim.bufferedPrint();
}

test "simple test of msgpack" {
    const allocator = std.testing.allocator;
    var buffer = try std.ArrayList(u8).initCapacity(allocator, 2048);
    defer buffer.deinit(allocator);

    try msgpack.encode(Message{
        .name = "John",
        .age = 20,
    }, buffer.writer(allocator));

    const decoded = try msgpack.decodeFromSlice(Message, allocator, buffer.items);
    defer decoded.deinit();

    std.debug.assert(std.mem.eql(u8, decoded.value.name, "John"));
    std.debug.assert(decoded.value.age == 20);
}
