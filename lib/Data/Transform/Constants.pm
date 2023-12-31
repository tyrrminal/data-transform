package Data::Transform::Constants;
use v5.38;

use Exporter qw(import);
use Readonly;

our @EXPORT = qw(
  $PATH_SEPARATOR

  $ARRAY_REF_TYPE
  $HASH_REF_TYPE

  $NO_MATCH
  $MATCH_DEFAULT
  $MATCH_INHERITED_TYPE
  $MATCH_EXACT_TYPE
  $MATCH_WILDCARD_PATH
  $MATCH_EXACT_PATH
  $MATCH_CORE_REF_TYPE
  $MATCH_EXACT
);

Readonly::Scalar our $PATH_SEPARATOR => q{/};

Readonly::Scalar our $ARRAY_REF_TYPE => ref([]);
Readonly::Scalar our $HASH_REF_TYPE  => ref({});

Readonly::Scalar our $NO_MATCH             => 0;
Readonly::Scalar our $MATCH_DEFAULT        => 1;
Readonly::Scalar our $MATCH_INHERITED_TYPE => 2;
Readonly::Scalar our $MATCH_EXACT_TYPE     => 3;
Readonly::Scalar our $MATCH_WILDCARD_PATH  => 4;
Readonly::Scalar our $MATCH_EXACT_PATH     => 5;
Readonly::Scalar our $MATCH_CORE_REF_TYPE  => 6;
Readonly::Scalar our $MATCH_EXACT          => 100;
