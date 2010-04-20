package Test::App;
use Moose;
use Path::Class;

use Catalyst::Runtime 5.80;
use Catalyst;

extends 'Catalyst';

my $app_root = __PACKAGE__->path_to('..', '..', '..');

__PACKAGE__->config(
    'View::TT' => {
        TEMPLATE_EXTENSION => '.tt',
        INCLUDE_PATH       => [
            $app_root->subdir(qw[ root templates ])
        ]
    },
    'Model::DBIC' => {
        schema_class => 'Test::App::Schema::DB',
        connect_info => [
            'dbi:SQLite:dbname=' . $app_root->file(qw[ root db ])
        ]
    }
);


__PACKAGE__->setup();

1;
