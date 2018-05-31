import std.process;
import std.stdio;

void main() {}

unittest
{
	auto compilersetup     = environment.get("compilersetup");
	auto compilersetupargs = environment.get("compilersetupargs");
	auto toolchain         = environment.get("toolchain");
	auto PLATFORM          = environment.get("PLATFORM");
	auto Darch             = environment.get("Darch");
	auto DConf             = environment.get("DConf");
	auto DVersion          = environment.get("DVersion");
	auto DC                = environment.get("DC");
	auto DMD               = environment.get("DMD");

	writeln("compilersetup:     ", compilersetup);
	writeln("compilersetupargs: ", compilersetupargs);
	writeln("toolchain:         ", toolchain);
	writeln("PLATFORM:          ", PLATFORM);
	writeln("Darch:             ", Darch);
	writeln("DConf:             ", DConf);
	writeln("DVersion:          ", DVersion);
	writeln("DC:                ", DC);
	writeln("DMD:               ", DMD);
}

unittest
{
	auto DMD = environment.get("DMD", "dmd");
	writeln("$DMD --help:");
	spawnShell(DMD~" --help").wait;
}

unittest
{
	writeln("rdmd --help:");
	spawnShell("rdmd --help").wait;
}

unittest
{
	writeln("dub --version:");
	spawnShell("dub --version").wait;
}
