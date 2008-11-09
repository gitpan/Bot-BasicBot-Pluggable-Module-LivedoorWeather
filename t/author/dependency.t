use Test::Dependencies
	exclude => [qw/Test::Dependencies Test::Base Test::Perl::Critic Bot::BasicBot::Pluggable::Module::LivedoorWeather/],
	style   => 'light';
ok_dependencies();
