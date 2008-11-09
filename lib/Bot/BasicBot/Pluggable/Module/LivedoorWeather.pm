package Bot::BasicBot::Pluggable::Module::LivedoorWeather;

use strict;
use warnings;
use WebService::Livedoor::Weather;
use base qw(Bot::BasicBot::Pluggable::Module);

our $VERSION = '0.03';

sub said {
    my ( $self, $mess, $pri ) = @_;
    my $body = $mess->{body};

    return unless ( $pri == 2 );

    my ( $command, $param ) = split( /\s+/, $body, 2 );
    $command = lc($command);

    if ( $command eq "weather" ) {
        my $message = "";
        eval {
            my $weather = $self->_get_weather($param);
            $message
                = "\cC14"
                . $weather->{title} . ": "
                . $weather->{description};
        };
        if($@) {
            $message = "Can't find such city: " . $param;
        }
        $self->reply( $mess, $message );
    }
}

sub _get_weather {
    my ( $self, $cityname ) = @_;
    my $api = WebService::Livedoor::Weather->new;

    # TODO: need to parametarize date?
    my $response = $api->get( $cityname, 'today' );
    $response;
}

sub help {
    return "Commands: 'weather <area>'";
}

1;
__END__

=head1 NAME

Bot::BasicBot::Pluggable::Module::LivedoorWeather - Get weather information from Livedoor Weather

=head1 SYNOPSIS

  use Bot::BasicBot::Pluggable::Module::LivedoorWeather;

=head1 DESCRIPTION

Bot::BasicBot::Pluggable::Module::LivedoorWeather is module which fetches weather information from Livedoor weather.

=head1 AUTHOR

Takatoshi Kitano E<lt>kitano.tk {at} gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
