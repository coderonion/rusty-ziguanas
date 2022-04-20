const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();
    
    // invoke cargo to build libprintln.so
    const build_libprintln = b.addSystemCommand(&[_][]const u8 {
        "cargo",
        "build",
        "--release",
    });

    const exe = b.addExecutable("hello-world", "src/main.zig");
    // depend on the libprintln.so build step
    exe.step.dependOn(&build_libprintln.step);
    exe.setTarget(target);
    exe.setBuildMode(mode);
    // add libprintln.so to linking step
    exe.addObjectFile("target/release/libprintln.so");
    // link against libc (necessary for rust)
    exe.linkLibC();
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_tests = b.addTest("src/main.zig");
    exe_tests.setTarget(target);
    exe_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&exe_tests.step);
}
