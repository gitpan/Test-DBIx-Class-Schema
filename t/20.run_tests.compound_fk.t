use strict;
use warnings;

use Test::More 0.92;
use lib qw(t/lib);
use TDCSTest;

# evil globals
my ($schema, $artist, $cd);

$schema = TDCSTest->init_schema();

ok(defined $schema, q{schema object defined});

use Test::DBIx::Class::Schema;

# create a new test object
my $schematest = Test::DBIx::Class::Schema->new({
    # required
    schema    => $schema,
    namespace => 'TDCSTest::Schema',
    moniker   => 'CDShopAudiophile',
});

# tell it what to test
$schematest->methods({
    columns => [qw(
        cdid
        shopid
        audiophileid
    )],

    relations => [qw(
        cd
        shop
        cdshop
        audiophile
    )],

    custom => [
    ],

    resultsets => [
    ],
});

# run the tests
$schematest->run_tests();
