use inc::Module::Install;
name 'Bot-BasicBot-Pluggable-Module-LivedoorWeather';
all_from 'lib/Bot/BasicBot/Pluggable/Module/LivedoorWeather.pm';

requires 'Bot::BasicBot::Pluggable';
requires 'WebService::Livedoor::Weather';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
